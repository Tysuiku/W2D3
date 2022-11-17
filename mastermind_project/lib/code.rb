class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS[char.upcase] != nil}
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
    @pegs = chars.map { |char| char.upcase }
    else
      raise "pegs are not valid"
    end
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def ==(other_code)
    self.length == other_code.length && self.num_exact_matches(other_code) == self.length
  end

  def num_exact_matches(guess_code)
    (0...guess_code.length).count { |i| guess_code[i] == @pegs[i] }
  end

  def num_near_matches(guess_code)
    code_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end
  
end
