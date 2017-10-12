require 'rails_helper'

RSpec.describe "Prizes requets", :type => :request do  
  let(:valid_params) do 
    {
      title: "test",
      description: "description test",
      existences: 1
    }
  end
  before do 
    @user = build(:user)
    @user.save
    sign_in @user
  end
  describe "GET /prizes" do
    it "returns http success" do
      get "/prizes"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /prizes/new" do
    it "returns http success" do
      get "/prizes/new"
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST '/prizes'" do
    it "Should create new prize" do
      post "/prizes", params: valid_params
      expect(flash["success"]).to eq("The prize has been created")
    end
    it "Shouldn't create new prize with invalid params" do
      post "/prizes", params: valid_params.merge(title: nil)
      expect(flash["error"]).to eq("Invalid params")
    end
  end
  describe "GET /prizes/:id/edit" do
    it "Should send the selectec prize to the view" do
      @prize = create(:prize)
      get "/prizes/1/edit"
      expect(response.status).to eq(200)
    end
    it "Should send invalid params error" do
      get "/prizes/1/edit"
      expect(flash["error"]).to eq("Invalid params")
    end
  end
  describe "POST /prizes/:id/update'" do
    it "Should send the selectec prize to the view" do
      @prize = create(:prize)
      post "/prizes/1/update", params: valid_params
      expect(flash["alert"]).to eq("The prize has been edited")
    end
    it "Should send invalid params error" do
      @prize = create(:prize)
      post "/prizes/1/update", params: valid_params.merge({title: nil})
      expect(flash["error"]).to eq("Invalid params")
    end
    it "Should send the selectec prize to the view" do
      @prize = create(:prize)
      post "/prizes/1/update", params: valid_params.merge(title: "new test")
      expect(flash["alert"]).to eq("The prize has been edited")
    end
    it "Shouldn't create new prize with invalid params" do
      @prize = create(:prize, title: "test")
      post "/prizes/1/update", params: valid_params.merge(title: nil)
      expect(flash["error"]).to eq("Invalid params")
    end
    it "Shouldn't create new prize with invalid params" do
      @prize = create(:prize, title: "test")
      post "/prizes/1/update", params: valid_params.merge(existences: -2)
      expect(flash["error"]).to eq("Invalid params")
    end
  end
  describe "delete /prizes/:id/update'" do
    it "Should delete the selectec prize" do
      @prize = create(:prize)
      get "/prizes/1/delete"
      expect(flash["alert"]).to eq("The prize has been deleted")
    end
    it "Shouldn't delete the selectec prize" do
      get "/prizes/1/delete"
      expect(flash["error"]).to eq("The prize could not been deleted")
    end
  end
end
