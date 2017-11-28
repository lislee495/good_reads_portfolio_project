class CreateBooksUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :books_users do |bu|
      bu.integer :book_id
      bu.integer :user_id
    end
  end
end
