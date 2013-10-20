require 'spec_helper'

describe InstallmentCalculator do
  describe '#total_amount' do
    it 'returns the amount with interest fee' do
      caculator = InstallmentCalculator.new

      caculator.amount = 1000.00 # Preço R$ 1000.00
      caculator.installments = 2 # 2 parcelas
      caculator.interest = 1.00 # 1% de juros

      expect(caculator.total_amount).to eq 1020.1
    end
  end

  describe '#installment_value' do
    it 'returns the installment value with interest fee' do
      caculator = InstallmentCalculator.new

      caculator.amount = 1000.00
      caculator.installments = 2
      caculator.interest = 1.00

      expect(caculator.installment_value).to eq 510.05
    end
  end
end
