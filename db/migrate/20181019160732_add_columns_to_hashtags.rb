class AddColumnsToHashtags < ActiveRecord::Migration[5.1]
  def change
    add_column :hashtags, :name, :string
    add_column :hashtags_politics, :hashtag_id, :integer   
    add_column :hashtags_politics, :politic_id, :integer    
    add_column :hashtags_politics, :politic_type_id, :integer   
  end
end
