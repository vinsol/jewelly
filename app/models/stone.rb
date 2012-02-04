class Stone < ActiveRecord::Base

	belongs_to :part

	def charges
		if rate_per_carat && weight
			rate_per_carat * weight
		else
			price
		end
	end

end
