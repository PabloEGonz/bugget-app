class CategoriesTransacts < ActiveRecord::Migration[7.0]
  def change 
    create_table :categories_transacts, id: false do |t|
      t.belongs_to :category
      t.belongs_to :transact
    end
  end
end
