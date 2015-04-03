class Hand

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def receive_cards(new_cards)
    cards.concat(new_cards)
  end




end
