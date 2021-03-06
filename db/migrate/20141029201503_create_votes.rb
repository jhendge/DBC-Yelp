class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id #the id of the object that it is
      t.belongs_to :user
      t.string  :voteable_type #if its a review or place
      t.boolean :upvote?

      t.timestamps
    end
  end


end
