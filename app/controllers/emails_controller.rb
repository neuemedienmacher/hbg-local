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
    @email.update_column(:tos_accepted, params[:tos_accepted])
    redirect_to emails_offers_path(@email)
  end


  private
  def find_email
    @email = Email.find params[:id]
  end

  def visible_offers_of_email email
    email.offers.visible_in_frontend
  end
end
