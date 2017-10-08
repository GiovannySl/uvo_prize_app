require 'rails_helper'

RSpec.describe Prize, type: :model do
  describe "Create" do
    context "Shouldn't create" do
      it "Without title" do
        @prize = build(:prize, title: nil)
        expect(@prize.save).to be false
      end
      it "Without description" do
        @prize = build(:prize, description: nil)
        expect(@prize.save).to be false
      end
      it "Without existences" do
        @prize = build(:prize, existences: nil)
        expect(@prize.save).to be false
      end
      it "Without active" do
        @prize = build(:prize, active: nil)
        expect(@prize.save).to be false
      end
    end
    context "Should create" do
      it "With valid attributes" do
        @prize = build(:prize)
        expect(@prize.save).to be true
      end
    end
  end
end
