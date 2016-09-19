class User < ApplicationRecord
	has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
	has_many :attended_events, :foreign_key => "attendee_id", :class_name => "Event", through: :invites
	has_many :invites, :foreign_key => "attendee_id"

	def upcoming_events
		upcoming_events = []
		self.attended_events.each do |event|
			if event.date && event.date > Time.now
				upcoming_events << event
			end
		end
		upcoming_events
	end

	def previous_events
		previous_events = []
		self.attended_events.each do |event|
			if event.date && event.date < Time.now
				previous_events << event
			end
		end
	end

end
