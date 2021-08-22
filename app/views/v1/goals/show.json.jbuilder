json.id goal.id
json.title goal.title
json.progress goal.progress
json.children do
  json.array! recursive_children(goal)
end