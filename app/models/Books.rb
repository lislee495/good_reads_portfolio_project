class Book < ActiveRecord::Base
  has_many :books_users
  has_many :users, through: :books_users
  belongs_to :author
  belongs_to :genre

  def slug
    slug = self.name.downcase!
    slug
  end

  def self.find_by_slug(slug)
    self.all.detect{ |object| object.slug == slug }
  end
end
