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
    describe "POST /conditions/:id/create" do
      it "Create condition" do
        create(:prize)
        post "/conditions/1/create"
        expect(flash["message"]).to eq("The condition has been created")
      end
      it "Shouldn't create  a condition" do
        post "/conditions/1/create"
        expect(flash["message"]).to eq("Invalid params")
      end
    end
  end