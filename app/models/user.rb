class User < ActiveRecord::Base
  attr_accessor :password, :confirm_password
  has_and_belongs_to_many :badges

  validates_uniqueness_of :email
end
