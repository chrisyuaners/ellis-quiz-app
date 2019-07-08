class CreateCardChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :card_choices do |t|
      t.references :card, foreign_key: true
      t.references :choice, foreign_key: true

      t.timestamps
    end
  end
end
