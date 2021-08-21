class Goal < ApplicationRecord
  belongs_to :goalable, polymorphic: true

  def children
    case self.goalable_type
    when 'Company'
      Goal.where('goalable_type = ? AND goal_parent_id = ?', 'Department', self.goalable_id)
    when 'Department'
     Goal.where('goalable_type = ? AND goal_parent_id = ?', 'Zone', self.goalable_id) 
    end
  end
end
