class OrnamentsController < ApplicationController

	active_scaffold :ornament do |config|
  
  		config.columns.exclude :created_at, :updated_at

		config.list.columns << :charges
		config.show.columns << :charges
  
	end

end 
