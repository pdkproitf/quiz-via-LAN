class ActionsController < ApplicationController

  attr_accessor :str,:count_ch #tao 1 bien de luu cac cau hoi tu file

  def index
      
  end

  def load_file
    @Cauhoi = Cauhoi.new
    @monhoc = Monhoc.find_by_id(params[:action_id].to_i)
  end

  def show
    if current_user.nil?
      redirect_to actions_path
    else
      @monhoc = Monhoc.find_by_id(params[:action_id].to_i)
      @diem = Diem.find_by(user_id: current_user.id,monhoc_id: @monhoc.id)
  end
  end

  def load_de
    @count_ch = 25
    @cauhoi = Array.new
    i = 0
    unless Cauhoi.where(monhoc_id: params[:action_id].to_i).empty?
      while i<@count_ch
      a = Cauhoi.where(monhoc_id: params[:action_id].to_i).sample.cauhoi
      unless  @cauhoi.include?(a)
        @cauhoi = @cauhoi.push(a)
        i = i+1
      end
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
    @diem = @count*10.0/25
    @mon = Monhoc.find_by_id(params[:action_id].to_i).tenmonhoc
    if Diem.where(user_id: current_user.id,monhoc_id: params[:action_id].to_i).empty?
      lanthi =1
    else
      lanthi = Diem.where(user_id: current_user.id,monhoc_id: params[:action_id].to_i).order(lanthi: :asc).last.lanthi+1
    end
    Diem.luu_ket_qua(current_user.id,params[:action_id].to_i,lanthi,@diem)
  end

  def doc_file(file_path)
    begin
      file = File.open(file_path.path,"r")
      while(item = file.readline) != nil
        @str += item
    end
    rescue EOFError
      file.close
    end
  end

  def xu_ly
    i = @str.split("Câu").size-1 #tru 1 vi phan tu dau tien rong
    c = @str.split("Câu")
    i.times{ |k|       # puts "lan thu #{k+1}" ;
      key = "" #key cho hash
      value = "" #value cho hash
       j = c[k+1].split("?").size
          cc = c[k+1].split("?")
            if !@distion.include?(cc[0]) #dua cau hoi vao tu dien va dua vao hash
              @distion.push(cc[0])
              key = cc[0]
              value = cc[1]
              if cc[2]!=nil&&cc[2].include?("\n")
                @dapandung[key]=cc[2].gsub("\n", "")
              else
                @dapandung[key]=cc[2]
              end
            end
          @hash[key] = value
    }
  end

  def them_cau_hoi
    if params[:file_txt]!=nil
      @dapan= ""
      @dapandung =Hash.new
      @str = ""
      @distion=Array.new
      @hash = Hash.new
      doc_file(params[:file_txt])#lay ten file
      xu_ly
      Cauhoi.update_ch(@distion,params[:action_id].to_i)#lay id mon hoc
      Dapan.update_ch(@distion,@hash)
      Dapandung.update_da(@distion,@dapandung)
  end
    redirect_to action_show_path(params[:action_id].to_i)
  end
  
end