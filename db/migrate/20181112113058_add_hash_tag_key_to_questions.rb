class AddHashTagKeyToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :option_a_key, :integer
    add_column :questions, :option_b_key, :integer
    add_column :questions, :option_c_key, :integer
    add_column :questions, :option_d_key, :integer
  end
end
