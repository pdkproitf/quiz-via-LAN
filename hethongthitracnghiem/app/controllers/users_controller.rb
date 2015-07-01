class UsersController < ApplicationController
  attr_accessor :str #tao 1 bien de luu cac cau hoi tu file

  def index
    @dapan= ""
    @str = ""
    @distion=Array.new
    @hash = Hash.new
    doc_file
    xu_ly
  end

  def load_de
    binding.pry
    @dapan= User.new
    @str = ""
    @distion=Array.new
    @hash = Hash.new
    doc_file
    xu_ly
  end

  def doc_file
    begin
      file = File.open("config/thuVIenCauHoi/de_thi_truong_chung_khoang.txt","r")
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
            end
          @hash[key] = value
    }
  end

end
