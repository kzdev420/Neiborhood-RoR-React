class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :description
      t.float :latitude
      t.float :longitude
      t.boolean :fulfilled
      t.references :user, foreign_key: true
      t.references :request_category, foreign_key: true

      t.timestamps
    end
  end
end
