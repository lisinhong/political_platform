class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :name
      t.string :email
      t.integer :affairs
      t.integer :transportation
      t.integer :economic
      t.integer :education
      t.integer :teen
      t.integer :citizen

      t.timestamps
    end
  end
end
