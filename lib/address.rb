class Address < ActiveRecord::Base
  validates :street1, :city, :state, :zip_code, :category, :presence => true
  belongs_to :contact
  validates :state, :inclusion => { :in => %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY),
    :message => "%{value} is not a valid state" }
  
end