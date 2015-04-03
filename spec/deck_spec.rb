require 'deck'

describe Deck do
  let(:deck) {Deck.new}
  let(:cards) {[ Card.new(:spades, :ace) ]}

  describe "::all_cards" do
    it "has 52 cards" do
      expect(Deck.all_cards.count).to eq(52)
    end

    it  "has no duplicate cards" do
      expect(Deck.all_cards.uniq.count).to eq(52)
    end

  end

  describe "#initialize" do
    subject(:deck2) {Deck.new(cards)}
    it "it creates a new deck with 52 cards by default" do
      expect(deck.cards.count).to eq(52)
    end

    it "can be created with an array of cards" do
      expect(deck2.cards).to eq(cards)
    end




  end


  describe "#deal" do
    it "deals given number of cards" do
      expect(deck.deal(5).count).to eq(5)
    end


    it "removes dealt cards from the deck" do
      deck.deal(2)
      expect(deck.cards.count).to eq(50)
    end



  end

  describe "#add_cards" do

    it "returns cards to the bottom of the deck" do
      deck.add_cards(cards)
      expect(deck.cards.count).to eq(53)
    end



  end

end
