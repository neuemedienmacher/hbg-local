# frozen_string_literal: true

require_relative '../test_helper'

describe OrganizationsController do
  let(:orga) { organizations(:basic) }

  describe "GET 'show'" do
    describe 'for an approved orga' do
      it 'should work (with friendly id)' do
        orga.update_columns name: 'bazfuz'
        get :show, params: { id: orga.slug, locale: 'de' }
        assert_response :success
        assert_select 'title', 'bazfuz | Handbook Germany'
      end

      it 'should use the correct canonical URL' do
        get :show, params: { id: orga.slug, locale: 'de' }
        assert_response :success
        assert_includes response.body,
                        "http://test.host/organisationen/#{orga.slug}"
      end

      # it 'should redirect if the wrong section was given' do
      #   get :show, params: { id: orga.slug, locale: 'de' }
      #   assert_redirected_to section: 'refugees'
      # end

      it 'shouldnt show on unapproved orga' do
        orga.update_columns aasm_state: 'closed'
        get :show, params: { id: orga.slug, locale: 'de' }
        assert_redirected_to controller: 'pages', action: 'not_found'
      end

      it 'should redirect to 404 if orga not found' do
        get :show, params: { id: 'doesntexist', locale: 'de' }
        assert_redirected_to controller: 'pages', action: 'not_found'
      end
    end

    describe 'for an all_done orga' do
      it 'should work (with friendly id)' do
        orga.update_columns name: 'bazfuz'
        get :show, params: { id: orga.slug, locale: 'de' }
        assert_response :success
        assert_select 'title', 'bazfuz | Handbook Germany'
      end

      # it 'should use the correct canonical URL' do
      #   get :show, params: { id: orga.slug, locale: 'de' }
      #   assert_response :success
      #   assert_includes response.body,
      #                   "http://test.host/organisationen/#{orga.slug}"
      # end

      # it 'should redirect if the wrong section was given' do
      #   orga.update_columns aasm_state: 'all_done'
      #   get :show, params: { id: orga.slug, locale: 'de' }
      #   assert_redirected_to section: 'refugees'
      # end
    end
  end
end
