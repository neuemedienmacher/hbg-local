# frozen_string_literal: true

include ApplicationHelper

class EmailsController < ApplicationController
  respond_to :html

  def offers_index
    find_email
    @offers = visible_offers_of_email(@email).order(updated_at: :desc)
  end

  # Non-RESTful resources, mostly for dev speed
  def update
    find_email
    if !params[:tos].nil? && Email.tos.values.include?(params[:tos])
      @email.update_column(:tos, params[:tos])
    end
    redirect_to action: 'offers_index', token: @email.token
  end

  private

  def find_email
    @email = Email.find_by token: params[:token]
    raise ActiveRecord::RecordNotFound unless @email
  end

  def visible_offers_of_email email
    email.offers.visible_in_frontend
  end
end
