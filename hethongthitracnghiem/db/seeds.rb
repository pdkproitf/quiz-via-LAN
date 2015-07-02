# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
Role.create(config["role_list"])
Khoa.create(config["khoa_list"])
Lop.create(config["lop_list"])
Monhoc.create(config["monhoc_list"])
Loaithi.create(config["loaithi_list"])
User.create(config["user_list"])

params_diem = config["diemThi_list"]
params_diem.each{ |d| 
  Diem.create(
    monhoc_id: d["monhoc_id"].to_i,
    user_id: d["user_id"].to_i,
    lanthi: d["lanthi"].to_i,
    diemthi: d["diemthi"].to_i,
    loaithi_id: d["loaithi_id"].to_i,
    thoigian: d["thoigian"].to_datetime
    )
}
