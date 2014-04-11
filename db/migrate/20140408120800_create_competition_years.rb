class CreateCompetitionYears < ActiveRecord::Migration
  def change
    create_table :competition_years do |t|
      t.integer :year, null: false
    end
  end
end
