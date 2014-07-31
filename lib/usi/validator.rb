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
    if ten_valid_characters?
      identifier.split('').last == checker.generate(identifier[0..8])
    else
      false
    end
  end

  def checker
    @checker ||= Usi::LuhnCheck.new(VALID_CHARACTERS)
  end

  private

  def ten_valid_characters?
    identifier =~ /\A[#{VALID_CHARACTERS.join}]{10}\z/
  end
end
