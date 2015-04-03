require 'deck'

describe Deck do
  let(:deck) {Deck.new}

  describe "::all_cards" do
    it "has 52 cards" do
      expect(Deck.all_cards.count).to eq(52)
    end

    it  "has no duplicate cards" do
      dedup = Deck.all_cards.
    end

  end




  describe "#initialize" do
    it "it creates a new deck with 52 cards by default" do

    end

    it  "can be created with an array of cards" do


    end

  end


  describe "#deal" do
    it "deals given number of cards" do


    end

    it "removes dealt cards from the deck" do

    end

  end

  describe "#add_cards" do

    it "returns cards to the bottom of the deck" do

    end


  end



end
