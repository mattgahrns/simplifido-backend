class RenameTypeToActivity < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :type, :activity
  end
end
