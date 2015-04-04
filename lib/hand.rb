class Hand

  RANKS = [:single_pair, :two_pair, :three_of_a_kind, :straight,
        :flush, :full_house, :four_of_a_kind, :straight_flush,
        :royal_flush]



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
      freq[card.value] += 1
    end

    freq
  end

  def rank
    ranks = RANKS.reverse
    ranks.each do |method|
      if send(method)
        return send(method)
      end
    end
    nil
  end


  def single_pair
    return false unless frequency.values.count == 4
    rank_num = 0
    frequency.each do |key, value|
      rank_num += Card.poker_values[key] * value
    end


    [:single_pair, rank_num]
  end


  def two_pair
    pairs = 0
    frequency.values.each do |value|
      pairs += 1 if value == 2
    end
    return true if pairs == 2
    false
  end

  def three_of_a_kind

  end

  def straight

  end

  def flush

  end

  def full_house

  end

  def four_of_a_kind

  end

  def straight_flush

  end

  def royal_flush

  end


end
