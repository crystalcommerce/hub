class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :database_name
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :country
      t.string :url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
