class UsersController < ApplicationController
    #     before_action :authenticate_user!
        before_action :set_user, only: [:show]
        respond_to :json
    
        def index
            @conversation = Conversation.find(params[:conversation_id])
            @users = User.all
            @filtered = @users.select do |user|
                user.conversation_ids.include?(@conversation.id)
            end
            render json: @filtered
        end
    
        def show 
            render json: @user
        end
    
        private
        def user_params
            params.permit(:conversation_id )
        end
    
        def set_user
            @user = User.find(params[:id])
        end
end