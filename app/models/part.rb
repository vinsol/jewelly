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

end
