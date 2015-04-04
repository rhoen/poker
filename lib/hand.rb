class Hand

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def receive_cards(new_cards)
    cards.concat(new_cards)
  end

  def remove(discarded)
    raise "Card not in hand." if discarded.any? {|card| !cards.include? card}
    removed = cards.select do |card|
      discarded.include? card
    end
    cards.reject! do |card|
      removed.include? card
    end
    # cards -= discarded

    discarded
  end

  def frequency
    freq = Hash.new(0)
    @cards.each do |card|
      freq[card] += 1
    end

    freq
  end

  def rank
  end
  

  def single_pair?
    frequency.values.include?{|value| value >= 2}
  end

  def two_pairs?
    pairs = 0
    frequence.values.each do |hand_count|
      pairs += 1 if hand_count >= 2
    end
    return true if pairs == 2
    false
  end
end
