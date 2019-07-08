class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :user, foreign_key: true
      t.integer :right
      t.integer :wrong

      t.timestamps
    end
  end
end
