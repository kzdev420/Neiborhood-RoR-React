class RequestsController < ApplicationController
    #     before_action :authenticate_user!
        before_action :set_request, only: [:show, :update, :destroy]
        respond_to :json
    
        def index
            @requests = Request.all
            render json: @requests
        end
    
        def show
            render json: @requests
        end
    
        def create
            #@request = Request.create!(request_params)
            @request = Request.new(request_params)
    #         @request.user_id = current_user.id
            @request.save!
    
            render json: @request, :status => 201
        end
    
        def update
            @request.update(request_params)
            head :no_content
        end
    
        def destroy
            @request.destroy
            head :no_content
        end
    
    
        private 
        def request_params
            params.permit(:latitude, :longitude, :fulfilled, :description, :user_id, :request_category_id)
        end
    
        def set_request
            @request = Request.find(params[:id])
        end
    
    end
    
