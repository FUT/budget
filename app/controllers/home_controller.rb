class HomeController < ApplicationController
  def index
    @users = User.all
    @transfers = current_user.transfers.order(:created_at).with_total
    @chart = Chart.basic_line @transfers
  end
end
