require 'csv'
class OrnamentsController < ApplicationController

  active_scaffold :ornament do |config|
    
        config.columns.exclude :created_at, :updated_at
  
    config.list.columns << :charges
    config.show.columns << :charges
    
  end
	
  # def import
  #     csv_text = File.read("/Users/mjuneja/jewelly/lot2.csv")
  #     csv = CSV.parse(csv_text, :headers => true)
  #     csv.each do |row|
  #       ot = OrnamentType.find_by_code(row["ItemCode"])
  #       name = ot.name
  #       code = row["Code"]
  #       fineness = row["Fineness"] == "18K" ? 18 : 14
  # 
  #       o = Ornament.new(:name => name, :code => code, :fineness => fineness, :ornament_type => ot, :labour => 0)
  # 
  #       gw = row["Gross Wt"]
  #       nw = row["NettWt"]
  #       pieces = row["NoOfPieces"]
  # 
  # 
  #       p = Part.new(:name => ot.name, :gross_weight => gw, :net_weight => nw, :number_of_pieces => pieces)
  #  
  #       
  #       no_of_dia = row["NoOfDiamonds"]
  #       dia_wt = row["Diamond Wt"]
  #       dia_clarity = row["DiamondClarity"]
  #       dia_color = row["DiamondColour"]
  # 
  #       d = Diamond.new(:clarity => dia_clarity, :color => dia_color, :number => no_of_dia, :weight => dia_wt, :rate_per_carat => 26000)
  #       p.diamonds<<d
  # 
  #       stone_name = row["StoneType"]
  #       stone_wt = row["StoneWt"]
  #       stone_price = 0 #row["StonePrice"]
  # 
  #       if !stone_name.blank?
  #         s = Stone.new( :name => stone_name, :price => stone_price, :weight => stone_wt)
  #         p.stones<<s
  #       end
  #       
  #       p.diamonds<<d      
  #       o.parts<<p
  #       o.save      
  #       
  #     end
  #   end
	
	
	def export
	  @ornaments = Ornament.order("created_at ASC")
	  respond_to do |format|
	    format.html
	    format.csv do
	      send_data(csv_for(@ornaments), :type=>csv_content_type, :filename => "orders.csv")
	    end
    end
  end

  def csv_for(ornaments)
    (output = "").tap do
      CSV.generate(output) do |csv| 
        ornaments.each do |ornament|
          csv << [ornament.code, ornament.charges]
        end 
      end
    end
  end  

  def csv_content_type 
    case request.user_agent when /windows/i
      'application/vnd.ms-excel'
    else
      'text/csv'
    end 
  end

end 
