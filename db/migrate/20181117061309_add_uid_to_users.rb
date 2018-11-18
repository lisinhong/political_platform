class AddUidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :u_id, :string
  end
end
