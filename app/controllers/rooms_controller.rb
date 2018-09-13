class RoomsController < ApplicationController
  before_action :authenticate_user! 
  def index  
  end 

  def create 
  	@other_user = User.find(params[:other_user])
    @room = find_room(@other_user) || Room.new(identifier: SecureRandom.hex)
    if !@room.persisted?
      @room.save
      @room.subscriptions.create(user_id: current_user.id)
      @room.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to room_path(current_user, @room,  :other_user => @other_user.id) 
	end 
  
	def show
    @other_user = User.find(params[:other_user])
		@room = Room.find_by(id: params[:id])
		@messages = Message.new
  end

	private

  def find_room(second_user)
		rooms = vurrent_user.room
		rooms.each do |room|
			room.subscriptions.each do |s| 
				if s.user_id == second_user.id 
					return room
				end
			end
		end 
		nil
	end 

	def require_login 
		redirect_to new_user_session_path unless signed_in?
	end 
end
