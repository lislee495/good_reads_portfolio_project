class Genre < ActiveRecord::Base
  has_many :books, through: :bookgenres
  has_many :bookgenres
  has_many :authors, through: :books
  has_many :users, through: :books

  include Slug::InstanceMethods
  extend Slug::ClassMethods

end
