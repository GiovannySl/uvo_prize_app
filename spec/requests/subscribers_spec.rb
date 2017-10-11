require 'rails_helper'

RSpec.describe "Subscribers requets", :type => :request do
  describe "GET '/' => #home" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST '/subscribers' => #home" do
    it "Should create new subscriber" do
      expect(Subscriber).to receive(:create).once
      post "/subscribers", params: {"email" => Faker::Internet.email }
    end
    it "Subscriber try the same day shoud get already registered today message" do
      create(:subscriber, email: "user@test.com")
      post "/subscribers", params: {"email" => "user@test.com" }
      expect(flash["alert"]).to eq("This email was already registered today.")
    end
    it "Subscriber try the after one day shoud get verify if won a prize" do
      subscriber = create(:subscriber, email: "user@test.com")
      new_date = subscriber.created_at - 1.day
      subscriber.update(created_at: new_date)
      post "/subscribers", params: {"email" => "user@test.com" }
      expect(flash["error"]).to eq("Try again tomorrow.")
    end
    context 'Win prize' do
      it "With specific number, and update the audit log" do
        num = Random.new.rand(1...5)
        prize = create(:prize, existences: 1)
        condition = build(:condition, {after_num: 0, number: num, condition_type: "S"})
        prize.conditions.create(condition.as_json)
        (1..5).each do
          post "/subscribers", params: {"email" => Faker::Internet.email }
        end
        expect(AuditLog.first.subscriber_id).to eq(num)
      end
      it "With multiple number, and update the audit log" do
        prize = create(:prize)
        condition = build(:condition, {after_num: 0, number: 2, condition_type: "M"})
        prize.conditions.create(condition.as_json)
        (1..10).each do
          post "/subscribers", params: {"email" => Faker::Internet.email }
        end
        expect(AuditLog.where(delivered: true).count).to eq(5)
      end
      it "if there are multiple prizes without deliver" do
        prize = create(:prize)
        (1..4).each do
          condition = build(:condition, {after_num: 0, number: 1, condition_type: "S"})
          prize.conditions.create(condition.as_json)
        end
        (1..4).each do
          post "/subscribers", params: {"email" => Faker::Internet.email }
        end
        expect(AuditLog.where(delivered: true).count).to eq(4)
      end
      it "Verify deliver prize after a given number" do
        prize = create(:prize)
        condition = build(:condition, {after_num: 5, number: 2, condition_type: "M"})
        prize.conditions.create(condition.as_json)
        (1..10).each do
          post "/subscribers", params: {"email" => Faker::Internet.email }
        end
        expect(AuditLog.where(delivered: true).count).to eq(3)
      end
    end

  end

end
