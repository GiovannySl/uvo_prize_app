require 'rails_helper'

  RSpec.describe "Condition requets", :type => :request do  
    let(:valid_params) do 
      {
        after_num: Faker::Number.between(1,99),
        number: Faker::Number.number(2),
        condition_type: nil
      }
    end
    before do 
      @user = build(:user)
      @user.save
      sign_in @user
    end
    describe "GET /conditions/1/new" do
      it "returns http success" do
        create(:prize)
        get "/conditions/1/new"
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET /conditions/1/new" do
      it "returns http success" do
        create(:prize)
        get "/conditions/1/new"
        expect(response).to have_http_status(:success)
      end
    end
    describe "POST /conditions/:id/create" do
      let(:valid_params) do 
        {
          after_num: Faker::Number.between(1,99),
          number: Faker::Number.number(2),
          condition_type: ["S", "M"][Faker::Number.between(0,1)]
        }
      end
      it "Create condition" do
        create(:prize)
        post "/conditions/1/create", params: valid_params
        expect(flash["success"]).to eq("The condition has been created")
      end
      it "Shouldn't create a condition if there is not prize with this id" do
        post "/conditions/1/create", params: valid_params
        expect(flash["error"]).to eq("Prize not found")
      end
      it "Shouldn't create  a condition with invalid params" do
        create(:prize)
        post "/conditions/1/create", params: valid_params.merge({number: -4})
        expect(flash["error"]).to eq("Invalid params")
      end
    end
    describe "get /conditions/:id/delete" do
      before do
        prize = create(:prize)
        condition = build(:condition)
        prize.conditions << condition
      end
      it "Should delete condition" do
        get "/conditions/1/delete"
        expect(flash["alert"]).to eq("The condition has been deleted")
      end
      it "Shouldn't delete condition" do
        get "/conditions/2/delete"
        expect(flash["error"]).to eq("Condition not found")
      end
    end
  end