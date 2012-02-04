class ConfsController < ApplicationController
  active_scaffold :conf do |config|
  		config.columns.exclude :created_at, :updated_at
  end
end 
