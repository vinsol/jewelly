class Part < ActiveRecord::Base

	belongs_to :ornament

	has_many :stones
	has_many :diamonds

	def charges
		gold_rate = Conf.where(:name => "goldrate").first.value
		total_value = ((net_weight * wastage * gold_rate * ornament.finesse)/24) + labour
		
		stones.each do |stone|
			total_value += stone.charges
		end

		diamonds.each do |diamond|
			total_value += diamond.charges
		end
		total_value
	end

	def wastage
			Wastage.where("wastages.from <= ? and wastages.to >= ?", ornament.finesse, ornament.finesse).first.value
	end

end
