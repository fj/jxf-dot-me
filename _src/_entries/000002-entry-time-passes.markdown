---
type:         experiment
title:        "Time Passes"
date:         2015-04-05T07:00:00Z
published:    true
tags:
  - thoughts
  - experiment
  - js
description: >
  How much time do we have left?
---

Every once in a while, I'll think about a somewhat morbid and yet universal question: how long do I have left to live? While no one knows for sure when their time will eventually run out, everyone confronts the reality of their ultimate fate [sooner or later](http://www.theonion.com/articles/world-death-rate-holding-steady-at-100-percent,1670/), willingly or not.

Thanks to its continuous presence in all human lives, people have thought about death quite a bit. One of my favorite ruminations on the subject is Longfellow's [_Psalm of Life_](http://www.bartleby.com/102/55.html):

> <div style="white-space: pre">Art is long, and Time is fleeting,
>   And our hearts, though stout and brave,
> Still, like muffled drums, are beating
>   Funeral marches to the grave.</div>

This excerpt, at first glance, sounds rather depressing and hopeless -- it suggests that we're inevitably and inextricably on a track towards doom. But on reading the full poem, we can see that it's actually an exhortation to make the most of the time we do have, no matter how long or short:

> <div style="white-space: pre">Lives of great men all remind us
>   We can make our lives sublime,   
> And, departing, leave behind us  
>   Footprints on the sands of time.</div>

I started reflecting about some other events that have been "footprints in the sands of time", and like any developer, decided to write a little code to investigate things. Below are the approximate dates of some historical and predicted future events, and how far away we are from them.

{% margin %}The dates given are approximations, of course; we don't know exact values for the first few events in the table.{% endmargin %}

| event | &Delta; time (in <a id="set-countdown-seconds" href="#">sec</a> &middot; <a id="set-countdown-days" href="#">days</a> &middot; <a id="set-countdown-years" href="#">yr</a>) |
| ----- | -----:|
| first humans evolve from primates | <span id="cd-first-humans">&middot;</span> |
| first [mechanical clock](http://en.wikipedia.org/wiki/Clock#Early_mechanical_clocks) | <span id="cd-first-mechanical-clock">&middot;</span> |
| first [movable-type printing press](http://en.wikipedia.org/wiki/Printing_press) | <span id="cd-first-printing-press">&middot;</span> |
| first e-mail over [ARPANET](http://en.wikipedia.org/wiki/ARPANET) | <span id="cd-arpanet-first-email">&middot;</span> |
| since I was born | <span id="cd-birthday">&middot;</span> |
| HTTP 1.0 | <span id="cd-http-1-0">&middot;</span> |
| September 11th attacks | <span id="cd-nine-eleven">&middot;</span> |
| Marty McFly's arrival in [the future](http://en.wikipedia.org/wiki/Back_to_the_Future_Part_II) | <span id="cd-back-to-the-future">&middot;</span> |
| 2016 U.S. presidential election | <span id="cd-2016-election">&middot;</span> |
| [Ray Kurzweil](http://en.wikipedia.org/wiki/Ray_Kurzweil)'s prediction for [the Singularity](http://en.wikipedia.org/wiki/Technological_singularity) | <span id="cd-singularity">&middot;</span> |
| Halley's comet returns in 21<sup>st</sup> century | <span id="cd-halleys-comet">&middot;</span> |
| world population reaches 10 billion | <span id="cd-10-billion-people">&middot;</span> |

{% margin %}It turns out we have a hard time <a href="http://jbr.sagepub.com/content/13/5/437.short">estimating even shorter durations accurately</a>, like one hour. Success depends on factors like our mood, sleep, health, and attention span.{% endmargin %}
The table is an interesting starting point for getting our bearings, but big stretches of time are tough to internalize for many people.
We can usually recall what we were doing a day ago with some fidelity. We can give the general outline of what happened ten days ago, maybe by consulting our calendar.

But it would be difficult to remember what was happening one hundred days ago. And going back one thousand days -- about 2.7 years -- is likely to exceed any normal person's capabilities. You can probably remember big ongoing events, like where you lived and your major relationships and friendships, but little else. These days are lost forever in the mists of time and memory.

{% margin %}Drew Houston, the CEO of Dropbox, gave the 2013 MIT <a href="http://newsoffice.mit.edu/2013/commencement-address-houston-0607">commencement address</a>, where he describes coming to the realization that he's already 9,000 days down at age 24 and resolving to make his life different as a result.{% endmargin %}
To put that in better perspective, citizens in the top one-third of countries by life expectancy can expect a mean lifespan of about <a href="http://en.wikipedia.org/wiki/List_of_countries_by_life_expectancy">eighty years</a>. That's about 30,000 days. By the time you hit your 27th birthday, you're down about 10,000 of those days -- and we can barely remember the overwhelming majority of them.

In that milieu, what does 10,000 days mean against your total lifespan? It's hard to get the same perspective there that we have for a single day or a week. What if we ask a more direct question: how much time do we have left, and how can we visualize that?

## Visualizing your lifespan

I made this small [`<canvas>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas) widget to help examine that question. We initially assume you'll live to the ripe old age of eighty and that you were born on January 1, 1980. Make adjustments below as necessary for your situation.

* Each colored horizontal line represents one year of your life.
* *Red*{: style="color: red"} years are your past: you can never get them back.
* *Green*{: style="color: green"} lines are your future, as yet unwritten.
* The pulsing *blue*{: style="color: blue"} dot shows where you are right now at this very moment.

<div>Your birthday is <input id="user-birthday" placeholder="YYYY-MM-DD" value="1980-01-01" style="width: 20ex">.</div>
<div>You expect to live for <input id="user-lifespan" type="number" value="80" max="150" style="width: 6ex; text-align: center"> years.</div>

<blockquote id="time-result">&nbsp;</blockquote>

<canvas id="time-result-visualization" width="400" height="650" style="border: 1px solid #ddd">Your browser doesn't support canvas elements.</canvas>

## Making the most of it

A series of lines feels like too simple a representation for something as complicated and messy as a human life. But I can't deny that this depiction also mirrors a simple truth: everyone has a finite amount of time alive before they become a husk of inert matter. Everything we will do or have done falls somewhere on one of those thin lines. It's ultimately up to us to make the most of it.

And yet, this doesn't need to be a discouraging idea. Longfellow had something to say about that, too:

> <div style="white-space: pre">Let us, then, be up and doing,
>   With a heart for any fate;
> Still achieving, still pursuing,
>   Learn to labor and to wait.</div>

<script src="//cdn.rawgit.com/moment/moment/2.9.0/moment.js"></script>
<script src="//cdn.rawgit.com/fj/8f41692b309f986c2d02/raw/c2845be8668eb838736bcf45a1d6a2b78986c82a/countdown-v2.5.2.js"></script>

<script type="text/javascript">
  var eventList = {
    "cd-first-humans": "-200000-01-01",
    "cd-first-mechanical-clock": "725-01-01",
    "cd-first-printing-press": "1045-06-01",
    "cd-arpanet-first-email": "1969-10-29",
    "cd-birthday": "1984-09-22",
    "cd-http-1-0": "1996-02-19",
    "cd-nine-eleven": "2001-09-11",
    "cd-back-to-the-future": "2015-10-21",
    "cd-2016-election": "2016-11-08",
    "cd-singularity": "2045-12-31",
    "cd-halleys-comet": "2061-07-28",
    "cd-10-billion-people": "2063-06-17"
  };
  
  function setCountdownDefaultUnits(u) {
    countdown.DEFAULTS = u;
    refreshTimers();
  }

  countdown.setLabels(
    ' ms| s| min| h| d| w| mo| y|',
    ' ms| s| min| h| d| w| mo| y|',
    ' <strong>&middot;</strong> ',
    ' <strong>&middot;</strong> ',
    null,
    function(n) { return n.toLocaleString() }
  );

  function findDateForEvent(e) {
    return eventList[e];
  }
  
  function countdownSuffix(c) {
    return (c.start < c.end) ? 'ago' : 'to go';
  }

  function countdownForEvent(e, u) {
    var units = u || countdown.DAYS;
    
    var c = countdown(
      new Date(e),
      null,
      units
    );
    
    return c;
  }

  function setCountdownForEvent(e) {
    var s = "";
    d = findDateForEvent(e);
    c = countdownForEvent(d, countdown.DEFAULTS);
    
    s += c;
    s += ' ' + countdownSuffix(c);
    
    document.getElementById(e).innerHTML = s;
  }

  function refreshTimers() {
    for(var eventName in eventList) {
      if(eventList.hasOwnProperty(eventName)) {
        setCountdownForEvent(eventName);
      }
    }
  }

  window.setInterval(refreshTimers, 250);
  document.getElementById('set-countdown-seconds').addEventListener('click', function(e) {
    setCountdownDefaultUnits(countdown.SECONDS);
    refreshTimers();
    e.preventDefault();
  });
  
  document.getElementById('set-countdown-days').addEventListener('click', function(e) {
    setCountdownDefaultUnits(countdown.DAYS);
    refreshTimers();
    e.preventDefault();
  });
  
  document.getElementById('set-countdown-years').addEventListener('click', function(e) {
    setCountdownDefaultUnits(countdown.YEARS | countdown.WEEKS);
    refreshTimers();
    e.preventDefault();
  });
  countdown.DEFAULTS = countdown.DAYS;
</script>

<script type="text/javascript">
  "use strict";

  var getField = function(id) {
    return document.getElementById(id);
  }
  
  var refreshCanvas = function() {
    var timer = inputConverter.getCountdownToDate(inputConverter.getBirthdateFromField());
    var normalizedWeeks = (timer.start < timer.end) ? (timer.years * 52 + timer.weeks) : 0;
    
    // render text
    textRenderer.render();
    
    // draw
    if (inputConverter.validate()) {
      console.log('weeks: ' + normalizedWeeks)
      canvasDrawer.transitionIndex = normalizedWeeks;
      canvasDrawer.gridRows        = inputConverter.getLifespanFromField();
      canvasDrawer.render();
    }
  };

  [getField('user-birthday'), getField('user-lifespan')].forEach(function(e, idx, arr) {
    e.addEventListener('keyup', refreshCanvas);
    e.addEventListener('change', refreshCanvas);
  });

  var inputConverter = {
    validate: function() {
      return (this.getBirthdateFromField().isValid() && parseInt(this.getLifespanFromField()) > 0);
    },
    
    getMomentFromField: function(id) {
      return moment.utc(getField(id).value, 'YYYY-MM-DD', true);
    },
    
    getBirthdateFromField: function() {
      return this.getMomentFromField('user-birthday');
    },
    
    getLifespanFromField: function() {
      return getField('user-lifespan').value;
    },
    
    getDifferenceInUnits: function(u) {
      return parseInt(moment().diff(this.getBirthdateFromField(), u));
    },
    
    getDeathdate: function() {
      return moment(this.getBirthdateFromField()).add(this.getLifespanFromField(), 'years');
    },
    
    getCountdownToDate: function(d1) {
      return countdownForEvent(new Date(d1), countdown.YEARS | countdown.WEEKS);
    },
  };
  
  var textRenderer = {
    render: function() {
      var birthdate = inputConverter.getBirthdateFromField();
      var lifespan  = inputConverter.getLifespanFromField();
      var deathdate = inputConverter.getDeathdate();
      
      var fmt = function(m) {
        return m.isValid() ? m.format('YYYY-MM-DD') : '{invalid date}';
      }
      
      var s = "";
      if (!birthdate.isValid()) {
        s += "Enter a valid birthdate (YYYY-MM-DD).<br>";
        getField('time-result').innerHTML = s;
        return;
      }
      
      if (birthdate < moment.utc()) {
        s += "You were born on <strong>" + fmt(birthdate) + "</strong>.<br>";
      } else {
        s += "You aren't born yet. You'll be born on <strong>" + fmt(birthdate) + "</strong>.<br>";
        getField('time-result').innerHTML = s;
        return;
      }
      
      if (deathdate > moment.utc()) {
        s += "If you live for <strong>" + lifespan + "</strong> years, you will die on <strong>" + fmt(deathdate) + "</strong>.<br>";
      } else {
        s += "You already died, on <strong>" + fmt(deathdate) + "</strong>. RIP, friend.<br>";
        getField('time-result').innerHTML = s;
        return;
      }
      
      var timer = inputConverter.getCountdownToDate(fmt(deathdate))
      s += "You have <strong>" + timer.toString() + "</strong> remaining."
      getField('time-result').innerHTML = s;
    }
  };

  // canvas drawing
  var canvasDrawer = {
    transitionIndex: 0,
    
    gridRows: 80,
    gridCols: 52,
    boxSize: {x: 5, y: 3},
    canvasPaddingSpacing: {x: 3, y: 3},
    minorSpacing: {x: 0, y: 3},
    majorSpacing: {x: 0, y: 10},
    minorSpacingFrequency: {x: 1, y: 1},
    majorSpacingFrequency: {x: 1, y: 5},
    ySeparatorFrequency: 10,
    
    stroke: "rgb(120, 120, 120)",
    
    animateFrame: window.requestAnimationFrame || 
      window.mozRequestAnimationFrame || 
      window.webkitRequestAnimationFrame || 
      window.msRequestAnimationFrame,
      
    cancelAnimateFrame: window.cancelAnimationFrame || 
                window.mozCancelAnimationFrame || 
                window.webkitCancelAnimationFrame || 
                window.msCancelAnimationFrame,
      
    circleAngle: 0,
    
    animating: false,
    
    render: function() {
      if (this.animating) {
        console.log('canceling animation ' + this.animating);
        this.cancelAnimateFrame.call(window, this.animating);
        this.animating = false;
      }
      var context = this.getCanvasElement().getContext('2d');
      context.canvas.height = this.getCanvasHeight();
      this.draw();
    },
    
    draw: function() {
      var context = this.getCanvasElement().getContext('2d');
      
      this.clearCanvas(context);
      this.drawGrid(context);
      this.drawAnimatedCircleWithAngle(context, this.circleAngle);
      this.circleAngle += 1;
      
      this.animating = this.animateFrame.call(window, this.draw.bind(this));
    },
    
    getCanvasHeight: function() {
      var spacing = this.calculateBaseSpacing(this.gridCols, this.gridRows);
      return spacing.y + this.canvasPaddingSpacing.y;
    },
    
    getCanvasElement: function() {
      return getField('time-result-visualization');
    },
    
    countMajorSpacing: function(x_i, y_i) {
      return {
        x: Math.floor(x_i / this.majorSpacingFrequency.x),
        y: Math.floor(y_i / this.majorSpacingFrequency.y),
      };
    },
    
    countMinorSpacing: function(x_i, y_i) {
      return {
        x: Math.floor(x_i / this.minorSpacingFrequency.x),
        y: Math.floor(y_i / this.minorSpacingFrequency.y),
      };
    },
    
    spacingSize: function(x_i, y_i) {
      var minorSpaces = this.countMinorSpacing(x_i, y_i);
      var majorSpaces = this.countMajorSpacing(x_i, y_i);
      
      var xSpacing = this.minorSpacing.x * minorSpaces.x + this.majorSpacing.x * majorSpaces.x;
      var ySpacing = this.minorSpacing.y * minorSpaces.y + this.majorSpacing.y * majorSpaces.y;
      
      return {
        x: xSpacing,
        y: ySpacing
      };
    },
    
    fill: function(index, limit) {
      var sign = (index && index !== limit) ? index < limit ? -1 : 1 : 0;
      
      switch (sign) {
        case -1:
          return "rgba(150, 0, 0, 0.2)";
        case 0:
          return "rgba(100, 100, 100, 0.6)";
        case 1:
          return "rgba(0, 150, 0, 0.5)";
        default:
          return undefined;
      }
    },
    
    clearCanvas: function(context) {
      var h = context.canvas.height;
      var w = context.canvas.width;
      
      context.setLineDash([]);
      context.lineWidth = 1;
      context.clearRect(0, 0, w, h);
    },
    
    drawPath: function(path) {
      return path();
    },
    
    horizontalLinePath: function(context, stroke, lineY) {
      context.beginPath();
      
      context.moveTo(0, lineY);
      context.lineTo(context.canvas.width, lineY);
      context.setLineDash([4,4]);
      context.stroke();
      
      return context;
    },
    
    rightTextLabelPath: function(context, fill, textY, text) {
      context.beginPath();
      
      context.font = "16px 'PTSans'";
      context.textAlign = 'right';
      context.textBaseline = 'bottom';
      context.fillStyle = fill;
      var padding = 10;
      
      var px = context.canvas.width - padding;
      var py = textY;

      context.fillText(text + " years", px, py);
      
      return context;
    },
    
    squarePath: function(context, stroke, fill, rect) {
      context.beginPath();
      
      context.rect.apply(context, rect);
      context.strokeStyle = stroke;
      context.fillStyle = fill;
      //context.stroke();
      context.fill();
      
      return context;
    },
    
    calculateSquare: function(x_i, y_i) {
      var spacing = this.calculateBaseSpacing(x_i, y_i);
      
      return [
        spacing.x,
        spacing.y,
        this.boxSize.x,
        this.boxSize.y
      ];
    },
    
    calculateCenterBoxSpacing: function(x_i, y_i) {
      var spacing = this.calculateBaseSpacing(x_i, y_i);
      
      return {
        x: spacing.x + (this.boxSize.x / 2),
        y: spacing.y + (this.boxSize.y / 2),
      };
    },
    
    calculateTransitionBoxPosition: function(transitionIndex) {
      var y_i = Math.floor(transitionIndex / this.gridCols);
      var x_i = transitionIndex - y_i * this.gridCols - 1;
      
      return this.calculateCenterBoxSpacing(x_i, y_i);
    },
    
    calculateLineSpacing: function(x_i, y_i) {
      var spacing = this.calculateBaseSpacing(x_i, y_i);
      var previousSpacing = this.calculateBaseSpacing(x_i, y_i - 1);
      var yMidpoint = ((previousSpacing.y + this.boxSize.y) + (spacing.y)) / 2
      
      return {
        x: spacing.x,
        y: yMidpoint,
      };
    },
    
    calculateBaseSpacing: function(x_i, y_i) {
      var spacingSize = this.spacingSize(x_i, y_i);
      
      var xSpacing =
        this.canvasPaddingSpacing.x + 
        spacingSize.x +
        this.boxSize.x * x_i
      
      var ySpacing =
        this.canvasPaddingSpacing.y + 
        spacingSize.y +
        this.boxSize.y * y_i
      
      return {
        x: xSpacing,
        y: ySpacing,
      };
    },
    
    drawGrid: function(context) {
      /// Draw a grid of squares on the context, taking into account the spacing parameters previously specified.
      /// Also draw a line and some text labels at frequencies determined by the ySeparatorFrequency.
      
      for (var y = 0; y < this.gridRows; y++) {
        for (var x = 0; x < this.gridCols; x++) {
          var fill   = this.fill(y * this.gridCols + x + 1, this.transitionIndex)
          
          var sPath = this.squarePath.bind(null, context, this.stroke, fill, this.calculateSquare(x, y));
          this.drawPath(sPath);
        }
        
        // Make sure we draw an extra line if that would equal the last row.
        if (y > 0 && (y + 1) % this.ySeparatorFrequency === 0) {
          var forY    = y + 1;
          var spacing = this.calculateLineSpacing(x, forY);
          
          var lPath = this.horizontalLinePath.bind(null, context, this.stroke, spacing.y);
          this.drawPath(lPath);
          
          var textPath = this.rightTextLabelPath.bind(null, context, "rgba(150, 150, 150, 1)", spacing.y, forY.toString());
          this.drawPath(textPath);
        }
      }
    },
     
    drawAnimatedCircleWithAngle: function(context, angle) {
      /// Draw a circle on the context.
      /// Use `angle` to vary the size of the circle, by making the radius depend on the angle.
      
      var arcSegments = 128.0;
      var arcFraction = ((angle % arcSegments) / arcSegments) * 2 * Math.PI;
      
      var radius = Math.max(this.boxSize.x, this.boxSize.y) + 2 * Math.abs(Math.cos(arcFraction));
      var p = this.calculateTransitionBoxPosition(this.transitionIndex);
      
      
      // Draw a dot on the center.
      context.beginPath();
      context.arc(p.x, p.y, radius, 0, Math.PI * 2);
      context.closePath();
      context.fillStyle = 'blue';
      context.fill();
    }
  };
  
  refreshCanvas();
</script>
