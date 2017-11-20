class User < ActiveRecord::Base
  has_many :books
  has_many :authors, through: :books
  has_many :genres, through: :books
  has_secure_password

  include Slug::InstanceMethods
  extend Slug::ClassMethods
end
