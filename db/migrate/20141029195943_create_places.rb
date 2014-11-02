class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :website
      t.float :lat
      t.float :lng
      t.text :description

      t.timestamps
    end
  end
end
