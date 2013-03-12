class CreatePhones < ActiveRecord::Migration
 def change
    create_table :phones do |t|
      t.column :number, :string
      t.column :type, :string
      t.timestamps
    end
  end 
end
