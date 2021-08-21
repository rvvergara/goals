include Rails.application.routes.url_helpers

company1 = FactoryBot.create(
  :company
)

sales1 = FactoryBot.create(
  :department,
  name: 'Sales',
  company_id: company1.id
)

marketing1 = FactoryBot.create(
  :department,
  name: 'Marketing',
  company_id: company1.id
)

east_zone = FactoryBot.create(
  :zone,
  name: 'East Zone',
  department_id: sales1.id
)

west_zone = FactoryBot.create(
  :zone,
  name: 'West Zone',
  department_id: sales1.id
)

company1_goal = FactoryBot.create(
  :goal,
  title: 'Close $1mn revenue by Q1',
  progress: 0,
  goalable_id: company1.id,
  goalable_type: 'Company',
  goal_parent_id: 0
)

sales1_goal = FactoryBot.create(
  :goal,
  title: 'Get 1000 demoes by Q1',
  progress: 0,
  goalable_id: sales1.id,
  goalable_type: 'Department',
  goal_parent_id: company1.id
)

east_zone_goal = FactoryBot.create(
  :goal,
  title: 'Get 200 demoes from East Zone by Q1',
  progress: 0,
  goalable_id: east_zone.id,
  goalable_type: 'Zone',
  goal_parent_id: sales1.id
)

west_zone_goal = FactoryBot.create(
  :goal,
  title: 'Get 700 demoes from West Zone by Q1',
  progress: 0,
  goalable_id: west_zone.id,
  goalable_type: 'Zone',
  goal_parent_id: sales1.id
)

marketing1_goal = FactoryBot.create(
  :goal,
  title: 'Get 1 Lakh visitors in our website by Q1',
  progress: 0,
  goalable_id: marketing1.id,
  goalable_type: 'Department',
  goal_parent_id: company1.id
)