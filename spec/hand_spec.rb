require 'hand'
require 'deck'
describe Hand do
  let(:cards) do
    [Card.new(:spades, :ace),
    Card.new(:spades, :three),
    Card.new(:spades, :four),
    Card.new(:spades, :five),
    Card.new(:spades, :six)]
  end

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

    let (:discarded) do
      [Card.new(:spades, :ace),
      Card.new(:spades, :three)]
    end

    let (:remaining) do
      [Card.new(:spades, :four),
      Card.new(:spades, :five),
      Card.new(:spades, :six)]
    end

    it  "return an array of removed cards" do
      expect(hand.remove(discarded)).to eq(discarded)
    end

    it  "removes cards from hand" do
      hand.remove(discarded)
      expect(hand.cards).to eq(remaining)
    end

    it "raises an error if card being removed is not in hand"

  end






end
