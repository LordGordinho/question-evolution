class AddSubjetcToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :subject, foreign_key: true
    rename_column :questions, :name, :content
    rename_column :options, :name, :content
  end
end
