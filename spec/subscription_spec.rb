require 'spec_helper'
require 'active_support'
require 'active_support/core_ext'

describe Subscription do
  describe '#has_mentoring?' do
    it 'returns its mentoring value' do
      mentoring = double('mentoring')
      subscription = Subscription.new(mentoring: mentoring)

      expect(subscription.has_mentoring?).to eq(mentoring)
    end
  end

  describe '#price' do
    it 'returns its price value' do
      price = double('price')
      subscription = Subscription.new(price: price)

      expect(subscription.price).to eq(price)
    end
  end

  describe '#charge' do
    it 'charges the credit card for its price' do
      price = double('price')
      credit_card = double('credit_card')
      allow(credit_card).to receive(:charge)
      subscription = Subscription.new(price: price)

      subscription.charge(credit_card)

      expect(credit_card).to have_received(:charge).with(price)
    end
  end
end
