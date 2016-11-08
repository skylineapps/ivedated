class AddQuestionsToLetters < ActiveRecord::Migration
  def change
  	add_column :letters, :Q1, :string
  	add_column :letters, :Q2, :string
  	add_column :letters, :Q3, :string
  	add_column :letters, :Q4, :string
  	add_column :letters, :Q5, :string
  	add_column :letters, :Q6, :string
  	add_column :letters, :Q7, :string
  	add_column :letters, :Q8, :string
  	add_column :letters, :Q9, :string
  	add_column :letters, :Q10, :string
  	add_column :letters, :Q11, :string
  	add_column :letters, :Q12, :string
  	add_column :letters, :Q13, :string
  	add_column :letters, :Q14, :string
  	add_column :letters, :Q15, :string
  	add_column :letters, :Q16, :string
  	add_column :letters, :Q17, :string
  	add_column :letters, :Q18, :string
  	add_column :letters, :Q19, :string
  	add_column :letters, :Q20, :string
  	add_column :letters, :Q21, :string
  end
end
