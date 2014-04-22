class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :team, null: false, index: true
      t.references :user, null: false, index: true
      t.integer :value, null: false
      t.timestamps
    end
  end
end
