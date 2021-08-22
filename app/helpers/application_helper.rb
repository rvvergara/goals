module ApplicationHelper
  def recursive_children(goal)
    return [] if goal.children.size == 0
    children = goal.children.map do |child|
      {
        id: child.id,
        title: child.title,
        progress: child.progress,
        children: recursive_children(child)
      }
    end
    children
  end
end