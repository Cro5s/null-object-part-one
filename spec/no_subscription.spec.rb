require 'spec_helper'

describe NoSubscription do
  describe '#charge' do
    subject { { subscription: NoSubscription.new } }

    context 'when a user does not have a subscription' do
      it 'does not charge the credit card' do
        subscription = NoSubscription.new
        credit_card = double('credit_card')
        subscription.charge(credit_card)

        expect(credit_card).not_to receive(:charge)
      end
    end
  end

  describe '#has_mentoring?' do
    it 'should return false' do
      expect(subject.has_mentoring?).to be false
    end
  end

  describe '#price' do
    it 'has no cost' do
      expect(subject.price).to eq(0)
    end
  end
end
