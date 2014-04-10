class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.references :team, null: false, index: true
      t.references :user, null: false, index: true
    end
  end
end
