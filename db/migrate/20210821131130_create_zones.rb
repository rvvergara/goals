class CreateZones < ActiveRecord::Migration[6.1]
  def change
    create_table :zones do |t|
      t.string :department_id
      t.string :name

      t.timestamps
    end
  end
end
