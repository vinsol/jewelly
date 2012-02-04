class WastagesController < ApplicationController
  active_scaffold :wastage do |config|
  		config.columns.exclude :created_at, :updated_at
  end
end 
