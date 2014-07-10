class Usi::Validator
  attr_accessor :identifier

  VALID_CHARACTERS = ['2', '3', '4', '5', '6', '7', '8', '9', 
                      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                      'J', 'K','L', 'M', 'N', 'P', 'Q', 'R',
                      'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

  def initialize(identifier)
    @identifier = identifier
  end

  def valid?
    return false if identifier.length < 10
    @identifier[-1] == check_character(identifier[0..9])
  end

  def check_character(identifier)
    factor = 2
    sum = 0
    base = identifier.length

    identifier.reverse.each_char do |character|
      code = VALID_CHARACTERS.index(character)
      break unless code

      e = factor * code
      # Alternate the "factor" that each "codePoint" is multiplied by
      factor = factor == 2 ? 1 : 2
      # Sum the digits of the "e" as expressed in base "number"
      code = (code / base) + (code % base)
      sum += e
    end

    # Calculate the number that must be added to the "sum"
    # to make it divisible by "base"
    remainder = sum % base
    check = (base - remainder) % base
    VALID_CHARACTERS[check]
  end
end
