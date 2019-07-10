class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.text :description
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end
