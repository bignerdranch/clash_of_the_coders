class AddDescriptionAndAppHomePageToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :description, :text
    add_column :teams, :homepage, :text
  end
end
