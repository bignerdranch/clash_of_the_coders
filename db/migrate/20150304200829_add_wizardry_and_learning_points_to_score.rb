class AddWizardryAndLearningPointsToScore < ActiveRecord::Migration
  def change
    add_column :scores, :wizardry_points, :integer, null: false, default: 0
    add_column :scores, :learning_points, :integer, null: false, default: 0
  end
end
