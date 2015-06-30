class CreateKhoas < ActiveRecord::Migration
  def change
    create_table :khoas do |t|
      t.string :tenkhoa,              null: false, default: ""
    end
  end
end
