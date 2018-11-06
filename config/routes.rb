# frozen_string_literal: true

Clarat::Application.routes.draw do
  get '/.well-known/acme-challenge/FqBLJjfCsodOPbKO1-imj268kqP_NXzPYu4vuUOasJA' => 'pages#letsencrypt'

  # Sitemap path
  mount DynamicSitemaps::Engine => '/sitemaps/'

  localized do
    # unscoped static pages
    # root to: 'pages#section_forward'
    get '/404' => 'pages#not_found'

    # scoped static pages
    get '/' => 'pages#home', as: 'home'
    get 'impressum' => 'pages#impressum', as: 'impressum'
    get 'rechtliche-hinweise' => 'pages#agb', as: 'agb'
    get 'datenschutzhinweise' => 'pages#privacy', as: 'privacy'

    # RESTful resources
    resources :offers, only: %i[index show]
    resources :organizations, only: [:show]

    # Previews
    get 'preview/offers/:id' => 'previews#show_offer'
    get 'preview/organizations/:id' => 'previews#show_organization'

    get 'widget-start-with-a-friend' => 'pages#widget_swaf', as: 'home'
    get 'widget-handbook-germany' => 'pages#widget_hg', as: 'home'
    get 'widget-handbook-germany-:city' => 'pages#widget_hg', as: 'home'

    # Email overviews
    get 'emails/:id/offers' => 'emails#offers_index', as: 'emails_offers'
    put 'emails/:id' => 'emails#update', as: 'update_email'

    # unscoped RESTful resources (only POST and non-HTML GET)
    resources :search_locations, only: [:show]
    resources :definitions, only: [:show]

    # All other localized paths => localized 404
    match '*path', to: 'pages#not_found', via: :all
  end

  # Unlocalized unknown paths are forwarded to the German 404
  match '*path', to: 'pages#not_found', via: :all
end
