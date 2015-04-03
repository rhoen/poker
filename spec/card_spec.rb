require "card"

describe Card do
  let(:card) {Card.new(:spades, :ace)}

  describe "#initialize" do
    it "creates a new card with suit and value" do
      expect(card.suit).to eq(:spades)
      expect(card.value).to eq(:ace)
    end

  end

  describe "::suits" do
    it "returns an array of all suits" do
      expect(Card.suits).to eq([:clubs, :diamonds,
        :hearts, :spades].sort)
    end
  end

  describe "::values" do
    it "returns an array of all card values" do
      expect(Card.values).to eq([:ace, :deuce, :eight, :five, :four,
       :jack, :king, :nine, :queen, :seven, :six, :ten, :three])
    end
  end


  describe "#==()" do
    it "returns true for cards of same suit and value"

    it "returns false for cards of different suit and/or value"
  end

end
