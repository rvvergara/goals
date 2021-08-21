class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.bigint :goalable_id, null: false
      t.bigint :goal_parent_id, null: false
      t.string :goalable_type, null: false, default: ''
      t.string :title
      t.integer :progress
      t.timestamps
    end
  end
end
