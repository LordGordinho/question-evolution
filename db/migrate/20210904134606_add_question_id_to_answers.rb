class AddQuestionIdToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question, foreign_key: true
    remove_column :answers, :content, :string
  end
end
