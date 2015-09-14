---
type:         review
title:        "The Comcast Differential Equation"
date:         2015-04-20T08:00:00Z
tags:
  - math
  - thoughts
description: >
  In which we explore the idea of an evil ISP through the lens of differential equations.
---

Suppose that your ISP were maximally evil.

![comcast logo]({{ page.image_asset_path }}/comcast.jpg)

maximally evil differential equation

<div id="jxgbox" style="margin: auto; width: 400px; height: 400px"></div>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.3/jsxgraphcore.js"></script>
<script type="text/javascript">
var board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox: [0, 10, 10, 0], axis: false, grid: false, showCopyright: false});
var p0 =  board.create('point',
  [
    function () {
      var coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [0, board.canvasHeight], board);
      return coords.usrCoords;
    }
  ],
  {needsRegularUpdate: false, visible: false}
);

var pX = board.create('point',
  [
    function () {
      var coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [board.canvasWidth, board.canvasHeight], board);
      return coords.usrCoords;
    }
  ],
  {needsRegularUpdate: false, visible: false}
);

var pY = board.create('point',
  [
    function () {
      var coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [0, 0], board);
      return coords.usrCoords;
    }
  ],
  {needsRegularUpdate: false, visible: false}
);


var xAxis = board.create('axis', [p0, pX],
  {
    ticks: { drawZero: true, label: { offset: [0, 8] } }
  }
);
var yAxis = board.create('axis', [p0, pY],
  {
    ticks: { drawZero: true }
  }
);
// time
var t = board.create('slider', [[0.8, 9.7], [2.5, 9.7], [1, 5, 100]],
  {
    name: 'time remaining',
    snapWidth: 1,
    precision: 0,
    point1: { frozen: true },
    point2: { frozen: true },
  }
);
// size of download
var k = board.create('slider', [[0.8, 9.2], [2.5, 9.2], [1, 6, 100]],
  {
    name: 'download size',
    snapWidth: 1,
    precision: 0,
    point1: { frozen: true },
    point2: { frozen: true },
  }
);

board.create('functiongraph',
  [
    // y = -k * e(-x/T) + k
    function(x) { return -k.Value()*Math.exp(-x/t.Value()) + k.Value(); },
    0
  ]
);

// asymptote
board.create('functiongraph',
  [
    // y = k
    function(x) { return k.Value(); }
  ],
  {dash:1}
);

function getAestheticBoundingBox() {
  var kMag = k.Value();
  var tMag = t.Value();
  var safeMinimum = 10;
  var limit = Math.max(safeMinimum, 1.15 * Math.max(k.Value(), t.Value()));
  
  return [0, Math.ceil(limit), Math.ceil(limit), 0];
}

k.on('drag', function() {
  board.setBoundingBox(getAestheticBoundingBox());
});

t.on('drag', function() {
  board.setBoundingBox(getAestheticBoundingBox());
});
</script>