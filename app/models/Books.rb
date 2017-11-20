class Book < ActiveRecord::Base
  belongs_to :users
  belongs_to :authors
  has_many :genres, through: :bookgenres
  has_many :bookgenres

  include Slug::InstanceMethods
  extend Slug::ClassMethods
end
