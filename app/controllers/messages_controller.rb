class MessagesController < ApplicationController
    #     before_action :authenticate_user!
        before_action :set_conversation
        respond_to :json
    
        def index
            @conversation = Conversation.find(params[:conversation_id])
            @messages = @conversation.messages
            
            render json: @messages
        end
    
        def create
            #@message = Message.create!(message_params)
            @message = Message.new(message_params)
    #         @message.user_id = current_user.id
            @message.save!
    
            render json: @message, :status=>201
        end
        
        private
        def set_conversation
            @conversation = Conversation.find(params[:conversation_id])
        end
    
        def message_params
            params.permit(:text, :user_id, :conversation_id)
        end
    end
    