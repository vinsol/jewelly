class StonesController < ApplicationController

	active_scaffold :stone do |config|

  		config.columns.exclude :created_at, :updated_at

		config.columns << :charges
		
	end

end 
