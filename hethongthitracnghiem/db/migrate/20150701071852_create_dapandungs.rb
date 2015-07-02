class CreateDapandungs < ActiveRecord::Migration
  def change
    create_table :dapandungs do |t|
      t.integer :cauhoi_id
      t.text :dapandung
    end
  end
end
