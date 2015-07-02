class Cauhoi < ActiveRecord::Base
  has_many :dapans
  has_one :dapandungs, :through => :dapans
  def self.update_ch(cauhoi)
    cauhoi.each{|ch|
      if ch.size>1
        Cauhoi.find_or_create_by(cauhoi: ch)
      end
    }
  end
end