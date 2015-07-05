class Diem < ActiveRecord::Base
  belongs_to :users
  belongs_to :monhoc
  def self.luu_ket_qua(user_id,monhoc_id,lanthi,diem)
    Diem.create(monhoc_id: monhoc_id,user_id: user_id,lanthi: lanthi,diemthi: diem,loaithi_id: 1,thoigian: Time.now)
  end
end
