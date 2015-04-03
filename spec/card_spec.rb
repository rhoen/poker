require "card"

describe Card do
  let(:card) {Card.new(:spades, :ace)}

  describe "#initialize" do
    it "creates a new card with suit and value" do
      expect(card.suit).to eq(:spades)
      expect(card.value).to eq(:ace)
    end




  end

end
