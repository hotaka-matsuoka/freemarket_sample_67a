require 'rails_helper'

describe TopController do
  describe 'GET #search' do
    it "search.html.erbに遷移すること" do
      get 'search'
      expect(response).to render_template 'search'
    end
  end
end
