class User < ActiveRecord::Base
  has_many :books_users
  has_many :books, through: :books_users
  has_many :authors, through: :books_users
  has_many :genres, through: :books_users
  has_secure_password

  def slug
    slug = self.username.downcase.split(" ").join("-")
    slug
  end

  def self.find_by_slug(slug)
    self.all.detect{ |object| object.slug == slug }
  end

end
