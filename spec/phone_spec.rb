require 'spec_helper'

describe Phone do
  context 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :category}
    it 'checks to make sure a phone number has exactly 10 digits' do
      phone = Phone.create(:number => '3777249')
      phone.valid?.should be_false
    end
  end

  context 'associations' do
    it {should belong_to :contact}
  end
end