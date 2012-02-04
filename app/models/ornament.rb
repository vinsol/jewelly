class Ornament < ActiveRecord::Base

	has_many :parts

	def charges
		parts.map(&:charges).sum
	end

end
