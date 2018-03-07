module ApplicationHelper
  def booking_status_collection
    Booking::statuses.map do |name, _key|
      [t("activerecord.attributes.booking.statuses.#{name}"), name]
    end
  end

  def channel_sources_collection
    Booking::channel_sources.map do |name, _key|
      [t("activerecord.attributes.booking.channel_sources.#{name}"), name]
    end
  end
end
