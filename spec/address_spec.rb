require 'spec_helper'

describe Address do
  context 'validations' do
    it {should validate_presence_of :street1}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
    it {should validate_presence_of :category}
    it {should ensure_inclusion_of(:state).in_array(%w[AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY])}
  end

  context 'associations' do
    it {should belong_to :contact}
  end   


end