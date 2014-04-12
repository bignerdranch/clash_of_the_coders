class RemoveConstraintsFromTeamMembers < ActiveRecord::Migration
  def up
    change_column_null(:team_members, :team_id, true)
    change_column_null(:team_members, :user_id, true)
  end

  def down
    change_column_null(:team_members, :team_id, false)
    change_column_null(:team_members, :user_id, false)
  end
end
