require 'spec_helper'

describe UserWallet do
  describe '#can_donate?' do
    let(:fat_wallet) { UserWallet.new(100) }
    let(:empty_wallet) { UserWallet.new(-1) }

    it 'returns true with sufficient funds' do
      expect(fat_wallet.can_donate?(100)).to be_true
    end

    it 'returns false with no amount' do
      expect(empty_wallet.can_donate?(100)).to be_false
    end

    it 'returns false with donation above the amount' do
      expect(fat_wallet.can_donate?(200)).to be_false
    end

    it 'returns false with negative donation' do
      expect(fat_wallet.can_donate?(-200)).to be_false
    end

    it 'returns true with payment token and not enough amount' do
      empty_wallet.payment_token = 'token'

      expect(empty_wallet.can_donate?(100)).to be_true
    end
  end
end
