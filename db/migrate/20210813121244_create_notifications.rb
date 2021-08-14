class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :action_user_id
      t.integer :ationed_user_id
      t.integer :post_id
      t.integer :comment_id
      t.integer :stamp_id
      t.boolean :check, default: false, null: false
      t.string :action

      t.timestamps
    end
  end
end
