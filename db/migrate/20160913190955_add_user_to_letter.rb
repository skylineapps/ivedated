class AddUserToLetter < ActiveRecord::Migration
  def change
  	add_reference :letters, :user, index: true
    add_foreign_key :letters, :users
  end
end
