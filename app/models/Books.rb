class Book < ActiveRecord::Base
  belongs_to :users
  belongs_to :author
  belongs_to :genre
  include Slug::InstanceMethods
  extend Slug::ClassMethods
end
