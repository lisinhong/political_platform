class AdjustColumnForHashtag < ActiveRecord::Migration[5.1]
  def change
    add_column :hashtags, :politic_type_id, :integer
    remove_column :hashtags_politics, :politic_type_id
  end
end
