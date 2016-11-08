class AddDatesToletters < ActiveRecord::Migration
  def change
  	add_column :letters, :date, :string 
  end
end
