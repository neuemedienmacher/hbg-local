# frozen_string_literal: true

# Static pages
class PagesController < ApplicationController
  def section_choice; end

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

  def section_forward
    split_path = request.fullpath.split('/', -1)
    insertion_index = split_path.last == params['locale'] ? -1 : -2
    forward_path =
      split_path.insert(insertion_index, Section::DEFAULT).join('/')
    redirect_to forward_path
  end
end
