class DiamondsController < ApplicationController

	active_scaffold :diamond do |config|

  		config.columns.exclude :created_at, :updated_at

	end

end 
