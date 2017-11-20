class CreateBookgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :book_genres do |bg|
      bg.integer :book_id
      bg.integer :genre_id
    end
  end
end
