require 'hand'
require 'deck'
describe Hand do
  let(:cards) {Deck.new.deal(5)}
  describe "#initialize" do
    subject(:hand) {Hand.new(cards)}
    it "gets the correct number of cards" do
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "#receive_cards" do
    subject(:hand) {Hand.new}
    it "receives the cards dealt to it and adds them to hand" do
      hand.receive_cards(cards)
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "#remove" do
    subject(:hand) {Hand.new(cards)}

    it  "return an array of removed cards" do
      expect(hand.discard().count).to eq(3)
    end

    it  "removes cards passed from hand" do

    end

    it "raises an error if card being removed is not in hand" do
      
    end

  end






end
