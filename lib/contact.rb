class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :presence => true
  before_save :capitalize_first_name, :capitalize_last_name
  has_many :emails
  has_many :phones
  has_many :addresses

  private

  def capitalize_first_name
    first_name.capitalize! 
  end

  def capitalize_last_name
    self.last_name = self.last_name.capitalize!
  end
  
end