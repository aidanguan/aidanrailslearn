class User < ActiveRecord::Base
  validates_uniqueness_of :name, :email, :role, :password
  validates_presence_of :name, :email
end
