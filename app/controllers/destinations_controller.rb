class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new  
    end

    def create
        @destination = Destination.create(params_check)
        redirect_to destination_path(@destination)
    end

    def show
        @destination = Destination.find(params[:id])
    end 


    private

    def params_check
        params.require(:destination).permit(:name,:country)
    end
end