class Author < ActiveRecord::Base
  has_many :books
  has_many :authors, through: => :books
  has_many :users, through: => :books

  include Slug::InstanceMethods
  extend Slug::ClassMethods

end
