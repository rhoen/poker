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

    let (:card) { [Card.new(:hearts, :ace)]}

    it "raises an error if card being removed is not in hand" do
      expect{hand.remove(card)}.to raise_error("Card not in hand.")

    end

  end

  describe "#rank" do
    let(:single_pair) do
      [Card.new(:spades, :ace),
      Card.new(:hearts, :ace),
      Card.new(:diamonds, :three),
      Card.new(:spades, :four),
      Card.new(:clubs, :five)]
    end

    let(:two_pair) do
      [Card.new(:spades, :ace),
      Card.new(:hearts, :ace),
      Card.new(:diamonds, :three),
      Card.new(:spades, :five),
      Card.new(:clubs, :five)]
    end

    let(:three_of_a_kind) do
      [Card.new(:spades, :ace),
      Card.new(:hearts, :ace),
      Card.new(:diamonds, :ace),
      Card.new(:spades, :five),
      Card.new(:clubs, :six)]
    end

    let(:straight_ace_low) do
      [Card.new(:spades, :ace),
      Card.new(:hearts, :deuce),
      Card.new(:diamonds, :three),
      Card.new(:spades, :four),
      Card.new(:clubs, :five)]
    end

    let(:straight_no_ace) do
      [Card.new(:spades, :six),
      Card.new(:hearts, :deuce),
      Card.new(:diamonds, :three),
      Card.new(:spades, :four),
      Card.new(:clubs, :five)]
    end

    let(:straight_ace_high) do
      [Card.new(:spades, :ace),
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack),
      Card.new(:hearts, :ten)]
    end

    let(:flush) do
      [Card.new(:spades, :three),
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack),
      Card.new(:spades, :ten)]
    end

    let(:full_house) do
      [Card.new(:spades, :ace),
      Card.new(:hearts, :ace),
      Card.new(:diamonds, :ace),
      Card.new(:spades, :five),
      Card.new(:clubs, :five)]
    end

    let(:four) do
      [Card.new(:spades, :ace),
      Card.new(:hearts, :ace),
      Card.new(:diamonds, :ace),
      Card.new(:spades, :five),
      Card.new(:clubs, :ace)]
    end

    let(:royal_flush) do
      [Card.new(:spades, :ace),
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack),
      Card.new(:spades, :ten)]
    end

    subject(:single_pair_hand) {Hand.new(single_pair)}
    subject(:two_pair_hand) {Hand.new(two_pair)}
    subject(:three_of_a_kind_hand) {Hand.new(three_of_a_kind)}
    subject(:straight_hand) {Hand.new(straight_no_ace)}
    subject(:straight_ace_high_hand) {Hand.new(straight_ace_high)}
    subject(:straight_ace_low_hand) {Hand.new(straight_ace_low)}
    subject(:flush_hand) {Hand.new(flush)}
    subject(:full_house_hand) {Hand.new(full_house)}
    subject(:four_of_a_kind_hand) {Hand.new(four)}
    subject(:full_house_hand) {Hand.new(full_house)}
    subject(:royal_flush_hand) {Hand.new(royal_flush)}

    it "returns single pair" do
      expect(single_pair_hand.frequency.values.count).to eq(4)
      expect(single_pair_hand.rank).to eq([:single_pair, 14, 5, 4 ,3])
    end
    it "returns  two pair" do
      expect(two_pair_hand.rank).to eq([:two_pair, 14, 5, 3])
    end
    it "returns true if hand include at least three of a kind" do
      expect(three_of_a_kind_hand.rank).to eq([:three_of_a_kind, 14, 6, 5])
    end
    it "returns straignt without an ace" do
      expect(straight_hand.rank).to eq([:straight, 6])
    end

    it "returns a straight with a high ace" do
      expect(straight_ace_high_hand.rank).to eq([:straight, 14])
    end

    it "returns a straight with a low ace"

    it "returns flush" do
      expect(flush_hand.rank).to eq([:flush, 13, 12, 11, 10, 3])

    end
    it "returns true if hand is a full house" do
      expect(full_house_hand.rank).to eq([:full_house, 14])
    end

    it "returns four of kind" do
      expect(four_of_a_kind_hand.rank).to eq([:four_of_a_kind, 14])
    end
    it "returns straight flush"
    it "returns royal flush"

  end

  describe "#=="

  describe "#winning_hand" do

    it ""

  end








end
