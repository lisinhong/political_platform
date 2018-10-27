class ChangeTypeColumnTypeForPolitic < ActiveRecord::Migration[5.1]
  def change
    rename_column :politics, :type, :first_type
  end
end
