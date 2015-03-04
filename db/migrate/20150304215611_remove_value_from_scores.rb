class RemoveValueFromScores < ActiveRecord::Migration
  def change
    remove_column :scores, :value, :integer, null: false
  end
end
