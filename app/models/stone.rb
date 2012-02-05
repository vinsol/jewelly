class Stone < ActiveRecord::Base

	belongs_to :part

	def charges
		if price.blank? || price == 0
		  rate_per_carat * weight
		else
		  price			
		end
	end

end
