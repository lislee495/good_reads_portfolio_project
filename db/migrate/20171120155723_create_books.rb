class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |b|
      b.string :name
      b.integer :author_id
      b.integer :user_id
    end
  end
end
