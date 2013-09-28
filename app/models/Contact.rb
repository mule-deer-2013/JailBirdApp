class Contact < ActiveRecord::Base

  attr_accessible :phone_number, :name

  belongs_to :user
  validates_presence_of :name, :phone_number
  before_save :sanitize_number

  def sanitize_number
    self.phone_number.gsub!(/^(\+?)1?\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})(\s*x[0-9]*)*$/, '+1\1\2\3\4\5')
    self.phone_number[0] = '' if self.phone_number[0] == '+' && self.phone_number[1] == '+'

  end

end
