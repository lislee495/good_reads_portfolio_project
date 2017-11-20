class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |a|
      a.string :name
    end
  end
end
