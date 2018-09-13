class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_for "messages_#{params[:chat_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
