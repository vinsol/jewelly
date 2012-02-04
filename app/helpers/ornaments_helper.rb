module OrnamentsHelper

	def ornament_parts_show_column(record)
		all_parts = record.parts

		content_tag :div do
			content_tag :ul do
				all_parts.each_with_index do |part, index|
					concat(content_tag(:label, "#{index + 1}. "))
					concat(content_tag(:label, part.name))
					concat(content_tag :br)

					concat(content_tag(:ul) do
						concat(content_tag(:label, "Net Weight "))
						concat(content_tag(:label, part.net_weight))
						concat(content_tag :br)
						
						concat(content_tag(:label, "Gross Weight "))
						concat(content_tag(:label, part.gross_weight))
						concat(content_tag :br)

						concat(content_tag(:label, "Labour "))
						concat(content_tag(:label, part.labour))
						concat(content_tag :br)

						concat(content_tag(:label, content_tag(:b, "Stones")))
						concat(content_tag :br)
						part_stones = part.stones
						
						concat(content_tag(:ul) do
							part_stones.each_with_index do |stone, i_stone|
								concat(content_tag(:label, "#{i_stone + 1}. "))
								concat(content_tag(:label, stone.name))
								concat(content_tag :br)
								concat(content_tag(:ul) do
									if stone.weight
										concat(content_tag(:label, "Weight "))
										concat(content_tag(:label, stone.weight))
										concat(content_tag :br)
									end

									if stone.rate_per_carat
										concat(content_tag(:label, "Rate per carat "))
										concat(content_tag(:label, stone.rate_per_carat))
										concat(content_tag :br)
									end

									if stone.price
										concat(content_tag(:label, "Price "))
										concat(content_tag(:label, stone.price))
										concat(content_tag :br)
									end
								end
								)
							end
						end
						)

						concat(content_tag(:label, content_tag(:b, "Diamonds")))
						concat(content_tag :br)
						part_diamonds = part.diamonds
						
						concat(content_tag(:ul) do
							part_diamonds.each_with_index do |diamond, i_diamond|
								concat(content_tag(:label, "#{i_diamond + 1}. "))
								concat(content_tag(:label, diamond.name))
								concat(content_tag :br)
								concat(content_tag(:ul) do
									if diamond.weight
										concat(content_tag(:label, "Weight "))
										concat(content_tag(:label, diamond.weight))
										concat(content_tag :br)
									end

									if diamond.rate_per_carat
										concat(content_tag(:label, "Rate per carat "))
										concat(content_tag(:label, diamond.rate_per_carat))
										concat(content_tag :br)
									end

									if diamond.price
										concat(content_tag(:label, "Price "))
										concat(content_tag(:label, diamond.price))
										concat(content_tag :br)
									end									
								end
								)
							end
						end
						)
					end
					)
				end
			end
		end
	end

	def ornament_name_column(record)
		link_to record.name, ornament_path(record)
	end

	def ornament_charges_column(record)
		if record.charges
			sprintf("%.2f",record.charges)
		else
			"N/A"
		end
	end

end
