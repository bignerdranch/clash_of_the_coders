class AddUniquenessConstraintToScores < ActiveRecord::Migration
  def change
    add_index :scores, [:user_id, :team_id]
  end
end
