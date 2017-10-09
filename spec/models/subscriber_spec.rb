require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  describe "Create" do
    context "Shouldn't create" do
      it "Without email" do
        @subscriber = build(:subscriber, email: nil)
        expect(@subscriber.save).to be false
      end
    end
    context "Should create" do
      it "With email" do
        @subscriber = build(:subscriber)
        expect(@subscriber.save).to be true
      end
    end
  end
end
