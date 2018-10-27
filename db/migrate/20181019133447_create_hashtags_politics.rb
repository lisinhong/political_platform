class CreateHashtagsPolitics < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags_politics do |t|

      t.timestamps
    end
  end
end
