require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe "Create" do
    before :each do
      @prize = create(:prize)
    end
    context "Shouldn't create" do
      context "with prize" do
        it "without number" do
          @condition = build(:condition, number: nil)
          @condition = @prize.conditions.build(@condition.as_json)
          expect(@condition.save).to be false
        end
        it "Without after_num" do
          @condition = build(:condition, after_num: nil)
          @condition = @prize.conditions.build(@condition.as_json)
          expect(@condition.save).to be false
        end
        it "Without condition_type" do
          @condition = build(:condition, condition_type: nil)
          @condition = @prize.conditions.build(@condition.as_json)
          expect(@condition.save).to be false
        end
      end
      it "With valid attributes and without prize" do
        @condition = build(:condition)
        expect(@condition.save).to be false
      end
    end
    context "Should create" do
      it "With valid attributes and prize" do
        @condition = build(:condition)
        @condition = @prize.conditions.build(@condition.as_json)
        expect(@condition.save).to be true
      end
    end
  end
end
