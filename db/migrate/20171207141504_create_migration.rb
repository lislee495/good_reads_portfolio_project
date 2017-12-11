class CreateMigration < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :owner_id, :integer
  end
end
