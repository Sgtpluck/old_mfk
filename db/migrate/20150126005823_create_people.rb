class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :image
      t.integer :marry, default: 0
      t.integer :fuck, default: 0
      t.integer :kill, default: 0

      t.timestamps null: false
    end
  end
end
