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
    let(:card2) {Card.new(:spades, :king)}
    let(:card3) {Card.new(:spades, :ace)}
    it "returns true for cards of same suit and value" do
      expect(card == card3).to eq(true)
    end

    it "returns false for cards of different suit and/or value" do
      expect(card2 == card3).to eq(false)
    end
  end

end
