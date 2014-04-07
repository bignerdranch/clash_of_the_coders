class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :active, null: false, default: true
      t.integer :bnr_team_id
      t.string :email, null: false, index: true
      t.string :gravatar, null: false
      t.string :name, null: false
      t.integer :uid

      t.timestamps
    end
  end
end
