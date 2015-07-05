class CreateCauhois < ActiveRecord::Migration
  def change
    create_table :cauhois do |t|
      t.text :cauhoi
      t.integer :monhoc_id
    end
  end
end
