class RepliesController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_reply, only: [:show, :update]
    respond_to :json

    def index
        @request = Request.find(params[:request_id])
        @replies = Reply.all
        
        @filtered = @replies.select do |reply|
            reply.request_id == @request.id
        end

        render json: @filtered
    end

    def show
        render json: @reply
    end

    def create
        @reply = Reply.new(reply_params)
        #@reply.volunteer_id = current_user.id
        @reply.save!

        render json: @reply, :status=>201
    end

    def update
        @reply.update(reply_params)
        head :no_content
    end

    private
    def reply_params
        params.require(:reply).permit(:request_id, :volunteer_id, :active, :message_sent)
    end

    def set_reply 
        @reply = Reply.find(params[:id])
    end
end
