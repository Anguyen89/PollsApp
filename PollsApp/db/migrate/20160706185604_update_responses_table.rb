class UpdateResponsesTable < ActiveRecord::Migration
  def change
    add_column :responses, :answer_choice_id, :integer, null: false
    add_index :responses, :answer_choice_id
    remove_column :responses, :question_id
  end
end
