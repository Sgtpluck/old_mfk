require 'rails_helper'

describe HomeController do

  describe 'get index page' do
    it 'should be successful' do
      get :index
      expect(response).to be_successful
    end
  end
end