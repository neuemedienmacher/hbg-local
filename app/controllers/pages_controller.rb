# frozen_string_literal: true

# Static pages
class PagesController < ApplicationController
  def home; end

  def impressum; end

  def agb; end

  def privacy; end

  def not_found
    render status: 404, formats: [:html]
  end

  def widget_swaf
    render layout: 'widget'
  end

  def widget_hg
    render layout: 'widget'
  end
end
