class CreateLops < ActiveRecord::Migration
  def change
    create_table :lops do |t|
      t.string :tenlop,              null: false, default: ""
      t.integer :khoa_id,              null: false, default: 0
    end
  end
end
