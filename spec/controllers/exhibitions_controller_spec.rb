require 'rails_helper'

describe ExhibitionsController, type: :controller  do

  describe 'GET #index' do
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response). to render_template :index
    end
    it "@exhibitionsに正しい値が入ってること" do
      exhibitions = create_list(:exhibition, 3)
      get :index
      expect(assigns(:exhibitions)).to match(exhibitions.sort{|a, b| b.created_at <=> a.created_at })
    end
  end

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@Exhibitionに正しい値が入ってること" do
      exhibition = create(:exhibition)
      get :edit, params: { id: exhibition }
      expect(assigns(:exhibition)).to eq exhibition
    end
  end

end