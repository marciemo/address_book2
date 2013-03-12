class Email < ActiveRecord::Base
  validates :email_address, :presence => true, :uniqueness => true
  validates :category, :presence => true
  validate :has_proper_format
  belongs_to :contact
  
  private

  def has_proper_format
    unless email_address =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email_address, "is in the wrong format.")
    end
  end

end