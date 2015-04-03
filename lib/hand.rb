class Hand

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def receive_cards(new_cards)
    cards.concat(new_cards)
  end

  def remove(discarded)
    removed = cards.select do |card|
      discarded.include? card
    end
    cards.reject! do |card|
      removed.include? card
    end
    # cards -= discarded

    discarded
  end



end
