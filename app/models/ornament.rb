class Ornament < ActiveRecord::Base

  belongs_to :ornament_type
	has_many :parts

	def charges
		(parts.map(&:charges).sum) + labour
	end

	def mmtc_code(counter)
	  str = "%03d" % counter
	  "DRO/LC/#{ornament_type.code}/#{str}/0513"
  end

end
