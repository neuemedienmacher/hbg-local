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

  # Let'sEncrypt SSL proof
  # rubocop:disable Metrics/LineLength
  def letsencrypt
    render plain: 'FqBLJjfCsodOPbKO1-imj268kqP_NXzPYu4vuUOasJA.WsiQAYWdBiKPD4ybEZzBUj_kEqZC0_qJuAoSfbbiL9Y'
  end
  # rubocop:enable Metrics/LineLength
end
