class AddCorrectOptionToOption < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :correct_option, :boolean, default: false
  end
end
