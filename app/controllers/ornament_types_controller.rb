class OrnamentTypesController < ApplicationController

  	active_scaffold :ornament_types do |config|
      config.columns.exclude :created_at, :updated_at
  	end

end
