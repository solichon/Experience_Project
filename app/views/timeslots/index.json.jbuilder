json.array! @timeslots do |timeslot|
  json.id timeslot.id
  json.title timeslot.title_for_calendar(@is_xs)
  json.capacity timeslot.capacity_for_calendar
  json.start timeslot.start_datetime
  json.end timeslot.end_datetime
  color = if timeslot.total_participants == timeslot.activity.capacity
    '#00DCB1' # vert
  elsif timeslot.total_participants >= 0.7*timeslot.activity.capacity
    '#DDB900' # yellow
  else
    '#FF6F59' # rouge
  end
  # json.backgroundColor color
  json.borderColor color
  json.textColor '#3C3C3C'
  json.allDay false
end



# Output Json
# {
#   title  : 'event3',
#   start  : '2018-03-08T12:30:00',
#   end    : '2018-03-08T14:30:00',
#   allDay : false // will make the time show
# }
