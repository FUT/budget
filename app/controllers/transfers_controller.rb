class TransfersController < ApplicationController
  def create
    params[:transfer][:tag_ids] = [params[:transfer].delete(:tags)]
    current_user.transfers.create params[:transfer]
    redirect_to root_path
  end

  def destroy
    Transfer.destroy params[:id]
  end
end
