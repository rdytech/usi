class Usi::LuhnCheck
  attr_reader :base_n, :valid_characters

  def initialize(valid_characters)
    @valid_characters = valid_characters
    @base_n = valid_characters.length
  end

  def generate(string)
    current_factor = 2
    results = string.reverse.each_char.map do |character|
      code_point = valid_characters.index(character)
      addend = calculate_addend(code_point, current_factor)
      current_factor = alternate_factor(current_factor)
      express_addend_in_base_n(addend)
    end

    sum = results.inject(0, &:+)
    valid_characters[find_check_character_code_point(sum)]
  end

  def alternate_factor(factor)
    factor == 2 ? 1 : 2
  end

  def calculate_addend(code_point, factor)
    code_point * factor
  end

  def express_addend_in_base_n(addend)
    (addend / base_n) + (addend % base_n)
  end

  def find_check_character_code_point(sum)
    (base_n - (sum % base_n)) % base_n
  end
end
