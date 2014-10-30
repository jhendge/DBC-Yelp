class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.belongs_to :map
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
