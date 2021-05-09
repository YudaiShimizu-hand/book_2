class RenameInformationColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :information, :introduction
  end
end
