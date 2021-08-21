class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.bigint :goalable_id, null: false, default: 0
      t.bigint :goal_parent_id, null: false
      t.string :goalable_type, null: false, default: ''
      t.string :title, null: false, default: ''
      t.integer :progress, null: false, default: 0
      t.timestamps
    end
  end
end
