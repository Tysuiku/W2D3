class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS[char.upcase] != nil}
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
    @pegs = chars.map { |char| char.upcase }
    else
      raise "pegs are not valid"
    end
  end

  
end
