class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,              null: false, default: ""
      t.text :desc
    end
  end
end
