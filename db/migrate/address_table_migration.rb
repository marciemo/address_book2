class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.column :street1, :string
      t.column :street2, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip_code, :string

      t.timestamps
    end
  end      
end