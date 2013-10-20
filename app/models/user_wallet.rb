class UserWallet
  attr_accessor :amount, :payment_token

  def initialize(amount)
    @amount = amount
  end

  def can_donate?(donation)
   donation > 0 &&
     (enough_for?(donation) || payment_token)
  end

  private

  def enough_for?(value)
    amount > 0 && amount >= value
  end
end
