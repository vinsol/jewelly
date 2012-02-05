class Ornament < ActiveRecord::Base

  belongs_to :ornament_type
	has_many :parts

	def charges
		(parts.map(&:charges).sum) + labour
	end

end
