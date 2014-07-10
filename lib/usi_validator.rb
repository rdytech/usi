class UsiValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    result = Usi::Validator.new(value).valid?
    record.errors[attribute] << 'is not a valid USI (Unique Student Identifier)' unless result
  end
end
