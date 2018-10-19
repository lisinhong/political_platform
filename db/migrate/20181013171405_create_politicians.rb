class CreatePoliticians < ActiveRecord::Migration[5.1]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :region
      t.string :party
      t.integer :age
      t.integer :gender
      t.string :city
      t.datetime :birth
      t.string :school
      t.string :experience

      t.timestamps
    end
  end
end
