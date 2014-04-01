class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :name, null: false
      t.integer :uid, null: false

      t.timestamps
    end
  end
end
