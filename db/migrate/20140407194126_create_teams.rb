class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :lineup, null: false, index: true
    end
  end
end
