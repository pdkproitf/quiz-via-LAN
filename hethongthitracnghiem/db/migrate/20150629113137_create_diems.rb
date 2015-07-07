class CreateDiems < ActiveRecord::Migration
  def change
    create_table :diems do |t|
      t.integer :monhoc_id,              null: false, default: 0
      t.integer :user_id,              null: false, default: 0
      t.integer :lanthi,              null: false, default: 0
      t.integer :diemthi,              null: false, default: 0
      t.integer :loaithi_id,              null: false, default: 0
      t.datetime :thoigian
    end
  end
end
