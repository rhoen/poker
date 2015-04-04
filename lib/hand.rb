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
    pairs = []
    remaining_cards = []
    frequency.each do |key, value|
      if value == 2
        pairs << Card.poker_values[key]
        next
      end
      remaining_cards << Card.poker_values[key]
    end



    [:single_pair].concat(pairs).concat(remaining_cards.sort.reverse)
  end


  def two_pair
    pairs = []
    remaining_cards = []
    frequency.each do |key, value|
      if value == 2
        pairs << Card.poker_values[key]
        next
      end
      remaining_cards << Card.poker_values[key]
    end
    return false unless pairs.length == 2


    [:two_pair].concat(pairs.sort.reverse).concat(remaining_cards)
  end

  def three_of_a_kind
    triplets = []
    remaining_cards = []
    frequency.each do |key, value|
      if value == 3
        triplets << Card.poker_values[key]
        next
      end
      remaining_cards << Card.poker_values[key]
    end
    return false unless triplets.count == 1 && frequency.keys.size == 3
    [:three_of_a_kind].concat(triplets).concat(remaining_cards.sort.reverse)
  end

  def straight
    card_values = cards.map {|card| card.poker_value}
    first = card_values.sort!.first
    j = 0
    first.upto(first+4) do |i|
      return false if i != card_values[j]
      j += 1
    end

    [:straight, card_values.last]

  end

  def flush
    suit = cards.first.suit
    card_values = []
    cards.each do |card|
      return false if card.suit != suit
      card_values << card.poker_value
    end

    [:flush].concat(card_values.sort.reverse)
  end

  def full_house
    triplets = []
    frequency.each do |key, value|
      if value == 3
        triplets << Card.poker_values[key]
        next
      end
    end
    return false unless  triplets.count == 1 && frequency.keys.size == 2
    [:full_house] + triplets
  end

  def four_of_a_kind
    quad = []
    frequency.each do |key, value|
      if value == 4
        quad  << Card.poker_values[key]
        next
      end
    end
    return false unless quad.count == 1
    [:four_of_a_kind] + quad
  end

  def straight_flush

  end

  def royal_flush

  end


end
