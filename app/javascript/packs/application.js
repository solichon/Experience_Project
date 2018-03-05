import "bootstrap";
import $ from 'jquery';

import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

$(document).ready(function() {

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    defaultView: 'agendaWeek',
    themeSystem: 'bootstrap3',
    header: {
      left: 'prev,next',
      center: 'addActivity,addTimeslot,addBooking',
      right: 'month,agendaWeek,agendaDay,'
    },
    footer: {
      left: 'custom1,custom2',
      weekNumbers: true,
      eventLimit: true, // allow "more" link when too many events
    },
    contentHeight: 600,  //size height
    aspectRatio: 1.5, //ration height vs. width (don't work)
    minTime: '10:00:00',
    maxTime: '20:00:00',
    allDaySlot: false,
    nowIndicator: true,
    // put your options and callbacks here
    customButtons: {
      addActivity: {
        text: '+ Activité',
        click: function() {
          window.location.replace('/activities/new');
        }
      },
      addTimeslot: {
        text: '+ Créneau',
        click: function() {
          window.location.replace('/timeslots/new');
        }
      },
      addBooking: {
        text: '+ Réservation',
        click: function() {
          window.location.replace('/bookings/new');
        }
      }
    },
    // eventClick: function(calEvent, jsEvent, view) {
    //   debugger;
    //   alert('clickend');
    eventRender: function(eventObj, $el) {
      // console.log('eventObj:', eventObj);
      debugger
      $el.popover({
        html:true,
        title: eventObj.title,
        content: `<a href="/timeslots/${eventObj.id}/bookings/new">Ajouter Réservation</a><a href="/timeslots/${eventObj.id}">Détails</a>` ,
        trigger: 'click',
        placement: 'top',
        container: 'body'
      })
    },
    events: '/timeslots'

  })
});
