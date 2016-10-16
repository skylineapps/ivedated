class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :title
      t.text :description
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
