class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps
    end
  end
end
