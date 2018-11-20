class AddPoliticianIdToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :politician_id, :integer
  end
end
