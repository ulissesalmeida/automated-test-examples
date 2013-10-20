class InstallmentCalculator
  attr_accessor :amount, :installments, :interest

  def total_amount
    amount * (1 + (interest / 100)) ** installments
  end

  def installment_value
    total_amount / installments
  end
end
