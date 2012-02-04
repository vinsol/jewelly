class PartsController < ApplicationController

	active_scaffold :part do |config|

  		config.columns.exclude :created_at, :updated_at

		config.columns << :charges

	end

end 
