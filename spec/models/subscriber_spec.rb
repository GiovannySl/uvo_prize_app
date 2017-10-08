require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  describe "Create" do
    context "Shouldn't create" do
      it "Without email" do
        @subscriber = build(:subscriber, email: nil)
        expect(@subscriber.save).to be false
      end
      it "Without try_date" do
        @subscriber = build(:subscriber, try_date: nil)
        expect(@subscriber.save).to be false
      end
      it "With existing email" do
        create(:subscriber, email: "user1@test.com")
        @subscriber = build(:subscriber, email: "user1@test.com")
        expect(@subscriber.save).to be false
      end
    end
    context "Should create" do
      it "With valid attributes" do
        @subscriber = build(:subscriber)
        expect(@subscriber.save).to be true
      end
    end
  end
end
