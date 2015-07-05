class Dapan < ActiveRecord::Base
  belongs_to :cauhoi
  def self.update_ch(cauhoi,dapan)
    cauhoi.each{|ch|
      if (ids = Cauhoi.find_by_cauhoi(ch).id) !=nil
       begin
          da = dapan[ch].split("\n")
          da.shift
          da.each{|f|
          Dapan.find_or_create_by(cauhoi_id: ids, dapan: f)
          }
       rescue Exception => e
         puts "nhap dap an {ch}"
       end
    end
    }
  end
end
