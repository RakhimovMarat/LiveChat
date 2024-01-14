# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @room.messages.create! params.required(:message)
                                 .permit(:body, :user_id, :author)
                                 .merge(user_id: current_user.id, author: current_user.username)
    redirect_to @room
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
