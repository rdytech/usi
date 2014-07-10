require 'spec_helper'


describe Usi::Validator do
  specify { expect(Usi::Validator.new("223456789X").valid?).to be false }
end
