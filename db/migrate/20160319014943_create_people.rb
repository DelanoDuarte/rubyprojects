class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.column :name, :string
      t.column :surname, :string
      t.timestamps
    end
  end
end
