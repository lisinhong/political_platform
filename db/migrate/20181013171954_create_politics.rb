class CreatePolitics < ActiveRecord::Migration[5.1]
  def change
    create_table :politics do |t|
      t.string :description
      t.integer :politician_id

      t.timestamps
    end
  end
end
