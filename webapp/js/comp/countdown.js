define(["jquery", "jquery.countdown"], function( $ ) {

var timeParts = {
  "day":    "totalDays",
  "hour":   "hours",
  "minute": "minutes",
  "second": "seconds"
};

var createTimeParts = function() {
  var parts = {};

  for( var part in timeParts ) {
    parts[ part ] = $("<span class='part' />")
      .addClass( part )
      .append("<span class='time' />")
      .append("<span class='label'>" + part + "</span>");
  }

  return parts;
};

return function() {
  // Find all countdowns
  $(".countdown").each(function() {
    var parts = createTimeParts(),
        self  = $( this );

    // Add the parts to the countdown
    for( var part in parts ) {
      self.append( parts[ part ] );
    }
    
    // Then create the countdown
    $( this ).countdown("2016/03/27")
      .on("update.countdown", function( evt ) {
        for( var part in parts ) {
          var time = evt.offset[ timeParts[ part ] ];

          parts[ part ]
            .attr("data-plural", time !== 1 )
            .find(".time")
            .text( time );
        }
      });
  });
};

});