class Goal < ApplicationRecord
  belongs_to :goalable, polymorphic: true
  after_save :update_parent

  def children
    case self.goalable_type
    when 'Company'
      Goal.where('goalable_type = ? AND goal_parent_id = ?', 'Department', self.goalable_id)
    when 'Department'
     Goal.where('goalable_type = ? AND goal_parent_id = ?', 'Zone', self.goalable_id)
    else
      []
    end
  end

  def update_parent
    return if self.parent.nil?

    puts "Updating parent with Goal ID: #{self.parent.id} and Goal Type #{self.parent.name}"
    
    parent_goal = Goal.find_by(goalable_id: self.parent.id)

    parent_children_count = parent_goal.children.count
    
    new_parent_progress = self.progress / parent_children_count
    parent_goal.update(progress: new_parent_progress)
  end

  private

  def parent
    case self.goalable_type
    when 'Company'
      return nil
    when 'Department'
      return Company.find(self.goal_parent_id)
    when 'Zone'
      return Department.find(self.goal_parent_id)
    end
  end
end
