class UsersController < ApplicationController
  attr_accessor :str #tao 1 bien de luu cac cau hoi tu file

  def index
    
  end

  def load_de
    @cauhoi = Array.new
    i = 0
    while i<5
      a = Cauhoi.all.sample.cauhoi
      unless  @cauhoi.include?(a)
        @cauhoi = @cauhoi.push(a)
        i = i+1
      end
    end
  end

  def ket_qua
    @diem = 0
    @count = 0
    params.each{|key,value|
      @th = Dapandung.find_by_cauhoi_id(key.to_i)
      unless @th.nil? 
        if @th.dapan_id == value.to_i
          @count = @count + 1
        end
      end
    }
    @diem = @count*10.0/5
  end

  def doc_file
    begin
      file = File.open("config/thuVIenCauHoi/de_thi_thi_truong_chung_khoang2.txt","r")
      while(item = file.readline) != nil
        @str += item
    end
    rescue EOFError
      file.close
    end
  end

  def xu_ly
    i = @str.split("-").size-1 #tru 1 vi phan tu dau tien rong
    c = @str.split("-")
    i.times{ |k|       # puts "lan thu #{k+1}" ;
      key = "" #key cho hash
      value = "" #value cho hash
       j = c[k+1].split("?").size
          cc = c[k+1].split("?")
            if !@distion.include?(cc[0]) #dua cau hoi vao tu dien va dua vao hash
              @distion.push(cc[0])
              key = cc[0]
              value = cc[1]
              @dapandung[key]=cc[2].gsub("\n", '')
            end
          @hash[key] = value
    }
  end

  def dua_vao_db
    @dapan= ""
    @dapandung =Hash.new
    @str = ""
    @distion=Array.new
    @hash = Hash.new
    doc_file
    xu_ly
    Cauhoi.update_ch(@distion)
    Dapan.update_ch(@distion,@hash)
    Dapandung.update_da(@distion,@dapandung)
    redirect_to users_path
  end

end
