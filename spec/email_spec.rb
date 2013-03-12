require 'spec_helper'

describe Email do
  context 'validations' do
    it {should validate_presence_of :email_address}
    it {should validate_presence_of :category}
    it {should validate_uniqueness_of :email_address}
    it 'checks to make sure an email is in the right format' do
      email = Email.create(:email_address => 'bobjones.com')
      email.valid?.should be_false

    end
  end

  context 'associations' do
    it {should belong_to :contact}
  end
end