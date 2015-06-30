class CreateMonhocs < ActiveRecord::Migration
  def change
    create_table :monhocs do |t|
      t.string :tenmonhoc,              null: false, default: "1"
      t.integer :sotinchi,              null: false, default: 1
    end
  end
end
