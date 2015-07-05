class Cauhoi < ActiveRecord::Base
  has_many :dapans
  has_one :dapandungs, :through => :dapans
  def self.update_ch(cauhoi,monhoc_id)
    cauhoi.each{|ch|
      if ch.size>1
        Cauhoi.find_or_create_by(cauhoi: ch,monhoc_id: monhoc_id)
      end
    }
  end

end