class RidesController < ApplicationController
    def create
        @ride = Ride.create(ride_params)
        message = @ride.take_ride
        @ride.user.update(id: params[:ride][:user_id])
        flash[:message] = [message]
        redirect_to user_path(@ride.user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end