class SharesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:search] == nil
      @shares= Share.all
    elsif params[:search] == ''
      @shares= Share.all
    else
      #部分検索
      @shares = Share.where("body LIKE ? ",'%' + params[:search] + '%')
    end

    @shares = @shares.page(params[:page]).per(3)

  end

  def new
    @share = Share.new
  end

  def create
    share = Share.new(share_params)

    share.user_id = current_user.id

    if share.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @share = Share.find(params[:id])
  end

  def edit
    @share = Share.find(params[:id])
  end

  def update
    share = Share.find(params[:id])
    if share.update(share_params)
      redirect_to :action => "show", :id => share.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    share = Share.find(params[:id])
    share.destroy
    redirect_to action: :index
  end

  private
  def share_params
    params.require(:share).permit(:shop_name, :adress, :evaluation, :body, :image)
  end

end
