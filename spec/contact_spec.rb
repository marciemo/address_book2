require 'spec_helper'

describe Contact do
  context 'validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}    
  end

  context 'associations' do
    it {should have_many(:emails)}
    it {should have_many(:phones)}
    it {should have_many(:addresses)}
  end

  context 'callbacks' do
    it 'converts the name to titlecase' do
      contact = Contact.create!(:first_name => "jessica", :last_name => "jones")
      contact.first_name.should eq "Jessica"
      contact.last_name.should eq "Jones"
    end
  end

end