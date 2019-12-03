class CreateRequestCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :request_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end


