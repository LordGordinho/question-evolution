class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.references :option, foreign_key: true
      t.integer :status, null: false
      t.boolean :first, null: false, default: true
      t.references :user, null: false

      t.timestamps
    end
  end
end
