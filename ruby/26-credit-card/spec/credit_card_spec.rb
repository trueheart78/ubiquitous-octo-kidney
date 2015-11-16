require_relative '../lib/credit_card'

RSpec.describe CreditCard do

  describe "#months_to_pay_off" do

    it "should detect the number of months" do
      cc = CreditCard.new(5000,12)

      expect(cc.months_to_pay_off(100)).to eq(70)
    end
  end

  describe "#payment_to_make" do

    it "should detect the amount of payment to make" do
      cc = CreditCard.new(5000,12)

      expect(cc.payment_to_make(70)).to eq(100)
    end
  end
end
