class CreateChanges < ActiveRecord::Migration[5.1]
  def change
    add_index :users, [:username, :password_digest, :email], :unique => true
  end
end
