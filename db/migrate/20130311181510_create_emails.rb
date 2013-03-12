class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.column :email_address, :string
      t.column :type, :string
      t.timestamps
    end
  end
end
