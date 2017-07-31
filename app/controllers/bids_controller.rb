class BidsController < ApplicationController
  include AttachmentsConcern
  before_action :set_bid, only: [:show, :update, :destroy]
  
  def index
  end

  def show
    @message = Message.new
  end

  def create
    @bid = Bid.new(bid_params)
    
    if @bid.save
      add_attachment(@bid, :bid) if attachment_params(:bid)
      flash["success"] = bid_placed
      redirect_to pro_dashboard_project_bids_path
    else
      flash.now[:danger] = @bid.errors.full_messages
      render '/pro_dashboard/open_projects/show'
    end
  end

  def update
    @bid.update(status: params[:new_status])
  end

  def destroy
    @bid.destroy
  end

  private

    def bid_params
      pro = {user_id: current_user.id}
      params.require(:bid).permit(:amount, :comment, :project_id).merge(pro)
    end

    def set_bid
      @bid = Bid.find(params[:id])
    end
end
