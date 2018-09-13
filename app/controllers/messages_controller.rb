class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user

if message.save
      #broadcasting out to messages channel including the chat_id so messages are broadcasted to specific chat only
      ActionCable.server.broadcast( "messages_#{message_params[:room_id]}",
      #message and user hold the data we render on the page using javascript 
      message: message.content,
      user: message.user.email
      )
    else
      redirect_to room_path
    end
  end

private
    def message_params
      params.require(:message).permit(:content, :room_id)
    end
end

