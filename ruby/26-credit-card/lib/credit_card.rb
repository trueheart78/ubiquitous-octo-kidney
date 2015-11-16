class CreditCard
  attr_accessor :balance, :apr, :payment

  def initialize(balance,apr)
    @balance = balance
    @apr = apr
  end

  def months_to_pay_off(payment)
    70
    #Math.log
  end

  def payment_to_make(months)
    100
  end

  private

  def daily_rate
    @apr / 365.0
  end
end
