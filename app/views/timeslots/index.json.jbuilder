json.array! @timeslots do |timeslot|
  json.id timeslot.id
  json.title timeslot.title_for_calendar
  json.start timeslot.start_datetime
  json.end timeslot.end_datetime
  json.borderColor '#00DCB1'
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
