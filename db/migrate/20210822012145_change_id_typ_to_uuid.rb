class ChangeIdTypToUuid < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :departments, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :departments, :company_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :zones, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :zones, :department_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :goals, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :goals, :goalable_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :goals, :goal_parent_uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :companies do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    change_table :departments do |t|
      t.remove :id
      t.remove :company_id
      t.rename :uuid, :id
      t.rename :company_uuid, :company_id
    end

    change_table :zones do |t|
      t.remove :id
      t.remove :department_id
      t.rename :uuid, :id
      t.rename :department_uuid, :department_id
    end

    change_table :goals do |t|
      t.remove :id
      t.remove :goalable_id
      t.remove :goal_parent_id
      t.rename :uuid, :id
      t.rename :goalable_uuid, :goalable_id
      t.rename :goal_parent_uuid, :goal_parent_id
    end
    
    execute "ALTER TABLE companies ADD PRIMARY KEY (id);"
    execute "ALTER TABLE departments ADD PRIMARY KEY (id);"
    execute "ALTER TABLE zones ADD PRIMARY KEY (id);"
    execute "ALTER TABLE goals ADD PRIMARY KEY (id);"

    # add_foreign_key :departments, :company_id
    # add_index :departments, :company_id
    # add_foreign_key :zones, :department_id
    # add_index :zones, :department_id
    # add_foreign_key :zones, :goalable_id
    # add_foreign_key :zones, :goal_parent_id
    # add_index :zones, :goalable_id
    # add_index :zones, :goal_parent_id

  end
end
