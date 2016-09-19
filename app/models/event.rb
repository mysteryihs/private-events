class Event < ApplicationRecord
	belongs_to :creator, :class_name => "User"
	has_many :attendees, :class_name => "User", :foreign_key => "attended_event_id", through: :invites
	has_many :invites, :foreign_key => "attended_event_id"

	scope :upcoming, -> {where("Date > ?", Time.now)}
	scope :past, -> {where("Date < ?", Time.now)}
end
