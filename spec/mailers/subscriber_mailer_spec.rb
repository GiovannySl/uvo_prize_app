require "rails_helper"

RSpec.describe SubscriberMailer, type: :mailer do
  describe "notify" do
    let(:subscriber) {create(:subscriber)}
    let(:mail) { SubscriberMailer.prize_won(subscriber).deliver_now }

    it "renders the headers" do
      expect(mail.to).to eq([subscriber.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
