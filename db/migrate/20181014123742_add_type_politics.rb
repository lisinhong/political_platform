class AddTypePolitics < ActiveRecord::Migration[5.1]
  def change
    add_column :politics, :type, :string
  end
end
