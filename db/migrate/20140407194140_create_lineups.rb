class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.integer :year, null: false
    end
  end
end
