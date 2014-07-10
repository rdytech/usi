require 'spec_helper'

describe Usi::Validator do
  let(:result) { Usi::Validator.new(usi) }

  context 'when USI is not a valid Luhn mod N string' do
    let(:usi) { '223456789X' }
    specify { expect(result).to_not be_valid }
  end

  context 'given the valid 10 digit Luhn mod N string' do
    ['223456789N',
     'H2289JJ33U'].each do |x|
      let(:usi) { x }

      it "#{x.inspect} should be valid" do
        expect(result).to be_valid
      end
    end
  end

  context 'when USI is a valid Luhn mod N string but not length 10' do
    ['3495289R',
     '34952895876V'].each do |x|
      let(:usi) { x }

      it "#{x.inspect} should not be valid" do
        expect(result).to_not be_valid
      end
    end
  end
end
