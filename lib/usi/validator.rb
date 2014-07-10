class Usi::Validator
  attr_accessor :identifier

  VALID_CHARACTERS = ['2', '3', '4', '5', '6', '7', '8', '9',
                      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                      'J', 'K','L', 'M', 'N', 'P', 'Q', 'R',
                      'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'].freeze

  def initialize(identifier)
    @identifier = identifier
  end

  def valid?
    return false unless ten_valid_characters?
    identifier[-1] == check_character(identifier[0..8])
  end

  private

  def ten_valid_characters?
    identifier =~ /\A[#{VALID_CHARACTERS.join}]{10}\z/
  end

  def check_character(string)
    # Implementation of Luhn Mod N algorithm for check digit
    factor = 2
    sum = 0
    base_n = VALID_CHARACTERS.length

    string.reverse.each_char do |character|
      code_point = VALID_CHARACTERS.index(character)

      addend = factor * code_point
      # Alternate the "factor" that each "codePoint" is multiplied by
      factor = factor == 2 ? 1 : 2
      # Sum the digits of the "addend" as expressed in base "n"
      addend = (addend / base_n) + (addend % base_n)
      sum += addend
    end

    # Calculate the number that must be added to the "sum"
    # to make it divisible by base "n"
    remainder = sum % base_n
    check = (base_n - remainder) % base_n
    VALID_CHARACTERS[check]
  end
end
