class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create room_params
    redirect_to rooms_path
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.order(created_at: :desc)
    render 'show'
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
