class CreateSessionCards < ActiveRecord::Migration[5.2]
  def change
    create_table :session_cards do |t|
      t.references :session, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
