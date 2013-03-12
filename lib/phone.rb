class Phone < ActiveRecord::Base
  validates :number, :category, :presence => true
  validate :has_proper_format
  belongs_to :contact

  def has_proper_format
    unless number =~ /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
      errors.add(:number, "is not a valid phone number.")
    end
  end

end