class Dapandung < ActiveRecord::Base
  belongs_to :cauhois

  def self.update_da(distion,dapandung)
      distion.each{|f|
      ch = Cauhoi.find_by_cauhoi(f)
      da= Dapan.find_by_dapan(dapandung[f])
      if ch!=nil?&&da!=nil
        Dapandung.find_or_create_by(cauhoi_id: ch.id,dapan_id: da.id)
      end
     }
  end
end
