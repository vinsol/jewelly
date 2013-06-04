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
	
	
	def import
      csv_text = File.read("/users/mjuneja/jewelly/csv_data/all.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        ot = OrnamentType.find_by_code(row["itemcode"])
        name = ot.name
        code = row["code"]
        fineness = row["k"] == "18" ? 18 : 14
        making = row["making"]
  
        o = Ornament.new(:name => name, :code => code, :fineness => fineness, :ornament_type => ot, :labour => making)
  
        gw = row["gwt"]
        nw = row["nwt"]
        pieces = row["pieces"]
  
  
        p = Part.new(:name => ot.name, :gross_weight => gw, :net_weight => nw, :number_of_pieces => pieces)
           
        dia_wt = row["dd1wt"]
        dia1rt = row["dd1rt"]
        dia_clarity = row["clarity"]
        dia_color = row["color"]
  
        d = Diamond.new(:clarity => dia_clarity, :color => dia_color, :number => 0, :weight => dia_wt, :rate_per_carat => dia1rt)
        p.diamonds<<d
        
        dia2 = row["dd2wt"]

        if !dia2.blank?
          dia2rt = row["dd2rt"]
          d = Diamond.new(:clarity => dia_clarity, :color => dia_color, :weight => dia2, :rate_per_carat => dia2rt)
          p.diamonds<<d
        end
        
        dia3 = row["dd3wt"]
        if !dia3.blank?
          dia3rt = row["dd3rt"]
          d = Diamond.new(:clarity => dia_clarity, :color => dia_color, :weight => dia3, :rate_per_carat => dia3rt)
          p.diamonds<<d
        end
        
  
        stone_name = row["st1"]
        stone_wt = row["st1wt"]
        stone_price = row["st1pr"]
  
        if !stone_name.blank?
          s = Stone.new( :name => stone_name, :price => stone_price, :weight => stone_wt)
          p.stones<<s
        end
        
        stone2_name = row["stonetype2"]
        stone2_wt = row["stonewt2"]
        stone2_price = 0
        if !stone2_name.blank?
          s = Stone.new( :name => stone2_name, :price => stone2_price, :weight => stone2_wt)
          p.stones<<s
        end
        
        o.parts<<p
        o.save      
        
      end
    end
	
  	def export
  	  @ornaments = Ornament.order("created_at ASC")
  	  respond_to do |format|
  	    format.html
  	    format.csv do
  	      send_data(csv_for_mmtc(@ornaments), :type=>csv_content_type, :filename => "orders.csv")
  	    end
      end
    end

    def csv_for_mmtc(ornaments)
      counter = 0
      dollar = 1
      (output = "").tap do
        CSV.generate(output) do |csv| 
          csv << ["ItemType", 
                  "ItemCode", 
                  "Fineness", 
                  "Pricing",
                  "BarCode", 
                  "",
                  "GrossWt",
                  "NettWt",
                  "NoOfPieces",
                  "MMTC Selling Price",
                  "Number of Diamonds",
                  "DiaWt",
                  "Dia Clarity",
                  "Diamond Price",
                  "Dia Color",
                  "StoneType",
                  "NoOfStones",
                  "StoneWt",
                  "StonePrice", 
                  "MMTC CP" 
                  ]
          ornaments.each do |o|
            counter = counter + 1
            p = o.parts[0]
            mmtc_cp = o.charges.round(0)
            mmtc_sp = mmtc_cp > 100000 ? mmtc_cp*1.15 : mmtc_cp*1.2
            mmtc_sp_rounded = ((mmtc_sp/100).round(0))*100
            csv << ["Studded Jewellery", 
                      o.ornament_type.code, 
                      "#{o.fineness} K", 
                      "Fixed", 
                      o.mmtc_code(counter), 
                      o.code, 
                      p.gross_weight, 
                      p.net_weight,
                      p.number_of_pieces,
                      mmtc_sp_rounded,
                      "",
                      p.dia_weight,
                      p.diamonds[0].clarity,
                      "",
                      p.diamonds[0].color,
                      p.stone_name,                      
                      "",
                      p.stone_wt,
                      p.stone_charges/dollar, 
                      mmtc_cp 
                      ]
          end 
        end
      end
    end  

    def csv_for_exhibition(ornaments)
      counter = 0
      dollar = 1
      (output = "").tap do
        CSV.generate(output) do |csv| 
          csv << ["Code", "Making"]
          ornaments.each do |o|
            counter = counter + 1
            p = o.parts[0]
            csv << [o.code, o.labour]
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
