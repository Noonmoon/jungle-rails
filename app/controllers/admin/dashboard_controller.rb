class Admin::DashboardController < ApplicationController
  # puts ENV['ADMIN_AUTH_USERNAME'].inspect
  # puts ENV['ADMIN_AUTH_PASSWORD'].inspect
  # FIXME: Make these use dotenv. Ask a mentor for help on Monday
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
  end
end
