class CreateDapans < ActiveRecord::Migration
  def change
    create_table :dapans do |t|
      t.integer :cauhoi_id
      t.text :dapan
    end
  end
end
