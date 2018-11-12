class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :p_type
      t.string :q_type
      t.string :o_comment
      t.string :m_comment
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d

      t.timestamps
    end
  end
end
