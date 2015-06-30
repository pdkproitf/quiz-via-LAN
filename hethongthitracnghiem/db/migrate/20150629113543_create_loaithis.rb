class CreateLoaithis < ActiveRecord::Migration
  def change
    create_table :loaithis do |t|
      t.string :name,              null: false, default: ""
      t.text :desc
    end
  end
end
