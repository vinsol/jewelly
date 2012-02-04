module PartsHelper

	def part_charges_column(record)
		sprintf("%.2f",record.charges)
	end

end
