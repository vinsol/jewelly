class Part < ActiveRecord::Base

	belongs_to :ornament

	has_many :stones
	has_many :diamonds
	
	def gold_charges
	  gold_rate = Conf.where(:name => "goldrate").first.value
		purity_factor = (ornament.fineness == 14) ? 0.60 : 0.78
		total_value = ((net_weight * wastage * gold_rate * purity_factor))
  end

	def charges
		total_value = gold_charges
		
		stones.each do |stone|
			total_value += stone.charges
		end

		diamonds.each do |diamond|
			total_value += diamond.charges
		end
		
		total_value
	end

	def wastage
			Wastage.where("wastages.fineness= ?", ornament.fineness).first.value
	end

  def dia_weight
    total_wt = 0
		diamonds.each do |diamond|
			total_wt += diamond.weight
		end
    total_wt
  end

  def dia_charges
    dia_charges = 0
		diamonds.each do |diamond|
			dia_charges += diamond.charges
		end
    dia_charges    
  end

  def dia_name
    name = ""
    diamonds.each do |dia|
			name += dia.name +"=>"+ dia.weight+" "
		end
    name
  end

  def stone_name
    name = ""
    stones.each do |st|
			name += st.name + " "
		end
    name
  end    

  def stone_wt
    total_wt = 0
		stones.each do |st|
			total_wt += st.weight
		end
    total_wt
  end

  def stone_charges
    st_charges = 0
		stones.each do |st|
			st_charges += st.charges
		end
    st_charges    
  end

end
