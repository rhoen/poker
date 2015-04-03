require_relative 'card'
class Deck

  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end


  attr_reader :cards

  def initialize(cards = self.class.all_cards)
    @cards = cards
  end

  def deal(num)
    cards.shift(num)
  end

  def add_cards(new_cards)
    cards.concat(new_cards)
  end



end
