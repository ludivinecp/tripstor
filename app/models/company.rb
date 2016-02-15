class Company < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :address
  has_many :comments

end
