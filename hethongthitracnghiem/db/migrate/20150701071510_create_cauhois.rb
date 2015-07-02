class CreateCauhois < ActiveRecord::Migration
  def change
    create_table :cauhois do |t|
      t.text :cauhoi
    end
  end
end
