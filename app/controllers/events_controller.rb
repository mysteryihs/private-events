class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def create
		event = current_user.created_events.build(event_params)
		event.save
		redirect_to event
	end

	def show
		@event = Event.find(params[:id])
	end

	def index
		@events = Event.all
		@upcoming = Event.upcoming
		@past = Event.past
	end

	private

	def event_params
		params.require(:event).permit(:description)
	end
end
