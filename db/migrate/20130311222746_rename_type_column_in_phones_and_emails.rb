class RenameTypeColumnInPhonesAndEmails < ActiveRecord::Migration

  def change
    rename_column :phones, :type, :category    
    rename_column :emails, :type, :category    
  end

end
