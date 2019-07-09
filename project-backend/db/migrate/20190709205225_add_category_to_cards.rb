class AddCategoryToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :category, :string
  end
end
