class CreateDapandungs < ActiveRecord::Migration
  def change
    create_table :dapandungs do |t|
      t.integer :cauhoi_id
      t.text :dapan_id
    end
  end
end
