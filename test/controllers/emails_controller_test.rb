# frozen_string_literal: true

require_relative '../test_helper'

describe EmailsController do
  describe 'public methods' do
    before do
      # contact_one is connected to basic email
      offers(:basic).contact_people = [contact_people(:contact_one)]
    end

    describe 'offers_index' do
      it 'should work for an existing email' do
        email = emails(:basic)
        get :offers_index, params: { id: email.id, locale: 'de' }
        assert_response :success
      end

      it 'should redirect to 404 if mail is not found' do
        get :offers_index, params: { id: 'doesntexist', locale: 'de' }
        assert_redirected_to controller: 'pages', action: 'not_found'
      end
    end

    describe 'update' do
      it 'should work for an existing email with existing param' do
        email = emails(:basic)
        get :update, params: {
          id: email.id, locale: 'de', tos: 'accepted'
        }
        assert_response 302
        email.reload.tos.must_equal 'accepted'
      end

      it 'should not update for an existing email with non-existing param' do
        email = emails(:basic)
        email.tos = 'uninformed'
        get :update, params: { id: email.id, locale: 'de' }
        email.reload.tos.must_equal 'uninformed'
      end

      it 'should not update for an existing email with invalid param' do
        email = emails(:basic)
        get :update, params: {
          id: email.id, locale: 'de', tos: 'invalid'
        }
        assert_response 302
        email.reload.tos.must_equal 'uninformed'
      end

      it 'should redirect to 404 if mail is not found' do
        get :update, params: { id: 'doesntexist', locale: 'de' }
        assert_redirected_to controller: 'pages', action: 'not_found'
      end
    end
  end
end
