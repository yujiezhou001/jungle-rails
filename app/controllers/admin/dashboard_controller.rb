class Admin::DashboardController < ApplicationController
  # include HttpAuthConcern
  http_basic_authenticate_with :name => ENV['USER_NAME'], :password => ENV['PASSWORD']
  def show
  end
end
