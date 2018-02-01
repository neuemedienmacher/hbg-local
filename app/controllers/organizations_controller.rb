# frozen_string_literal: true

class OrganizationsController < ApplicationController
  include GmapsVariable
  respond_to :html

  def show
    @organization = Organization.visible_in_frontend.friendly.find_by(
      slug: params[:id]
    )
    raise ActiveRecord::RecordNotFound unless @organization
    prepare_gmaps_variable @organization
    @contact = Contact.new url: request.url, reporting: true
    respond_with @organization
  end
end
