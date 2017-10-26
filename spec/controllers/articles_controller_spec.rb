require 'rails_helper'

RSpec.describe ArticlesController do
  describe "show action" do
    it "renders show template if an item is found" do
      article = FactoryGirl.create(:article)
      get :show, params: { id: article.id }

      expect(response).to render_template(:show)
    end

    it "render 404.html if item is not found" do
      get :show, params: {id: 0}

      expect(response.status).to eq(404)
     end
  end

  describe "create action" do
    it "redirect to create page if there are admin rights" do
      get :new, params: {log: "admin", pass: "dfd"}

      expect(response).to render_template(:new)
    end

    it "redirect to home page if not admin" do
      get :new, params: {}

      expect(response).to redirect_to("/articles")
    end
  end
end