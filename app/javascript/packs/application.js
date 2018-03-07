import "bootstrap";
import $ from 'jquery';

import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';
import 'fullcalendar/dist/locale/fr.js'
// import 'fullcalendar/lang/fr.js';

import 'bootstrap-select';
import 'bootstrap-select/dist/css/bootstrap-select.css';


$(document).ready(function() {
  $('.selectpicker').selectpicker();

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    locale:"fr-fr",
    defaultView: 'agendaWeek',
    themeSystem: 'bootstrap3',
    header: {
      left: 'prev,next',
      center: 'title',
      right: 'month,agendaWeek,agendaDay,'
    },
    footer: {
      left: 'custom1,custom2',
      weekNumbers: true,
      eventLimit: true, // allow "more" link when too many events
    },
    contentHeight: 588,  //size height
    aspectRatio: 1, //ration height vs. width (don't work)
    minTime: '10:00:00',
    maxTime: '20:00:00',
    allDaySlot: false,
    nowIndicator: true,
    displayEventTime: false,
    // put your options and callbacks here
    titleFormat: '[Gégé, quel est mon planning?]',
    // customButtons: {
    //   addTitle: {
    //     text: 'Gégé, quel est mon planning?'
    //   }
    // },
    // eventClick: function(calEvent, jsEvent, view) {
    //   debugger;
    //   alert('clickend');
    eventRender: function(eventObj, $el) {
      // console.log('eventObj:', eventObj);
      $el.popover({
        html:true,
        title: eventObj.capacity,
        content: `<a href="/timeslots/${eventObj.id}/bookings/new">Ajouter Réservation</a><a href="/timeslots/${eventObj.id}">Détails</a>` ,
        trigger: 'click',
        placement: 'top',
        container: 'body'
      })
    },
    events: '/timeslots',
    eventBackgroundColor: '#FFFFFF'


  })
});

