require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  describe "Create" do
    before :each do
      @prize = create(:prize)
      @prize.conditions.create(build(:condition).as_json)
      @condition = Condition.first
    end
    context "Shouldn't create" do
      it "Witn delivered and prize, without condition" do
        @audit_log = build(:audit_log)
        @audit_log = @prize.audit_logs.build(@audit_log.as_json)
        expect(@audit_log.save).to be false
      end
      it "Witn delivered and condition, without prize" do
        @audit_log = build(:audit_log)
        @audit_log = @condition.audit_logs.build(@audit_log.as_json)
        expect(@audit_log.save).to be false
      end
    end
    context "Should create" do
      it "Witn delivered, prize and condition" do
        @audit_log = build(:audit_log)
        @audit_log = @prize.audit_logs.build(@audit_log.as_json)
        @audit_log = @condition.audit_logs.build(@audit_log.as_json)
        expect(@audit_log.save).to be true
      end
    end
  end
end
