+++
date = "2017-09-24T12:00:00"
draft = false
tags = ["Data Visualization", "D3"]
title = "A deep dive into Data Visualization, D3.js and SVG"
math = true
summary = """
Data Visualization, D3.js and SVG
"""

+++

# Data Visualization and D3.js

## Sections:

* [What is Data Visualization](#what-is-data-visualization)
* [Types of Visual Diagrams](#types-of-visual-diagrams)
* [D3 API Docs](#d3-api-docs)
* [List of D3 Modules](#list-of-d3-modules)
* [Selections and Data](#selections-and-data)
* [Enter and Append](#enter-and-append)
* [SVG Basic Shapes](#svg-basic-shapes)
* [Scales and Axis](#scales-and-axis)
* [Enter and Update](#enter-and-update)
* [Exit and Merge](#exit-and-merge)
* [Transitions](#transitions)
* [Force Layout](#force-layout)
* [D3 and Vuejs](#d3-and-vuejs)
* [Data Visualization Best Practices](#data-visualization-best-practices)
* [General Data Visualization Resources](#general-data-visualization-resources)
* [Data Visualization Experts and Companies](#data-visualization-experts-and-companies)
* [GitBook Link](#gitbook-link)
* [Github Repo](#github-repo)

## What is Data Visualization

* Data visualization is the presentation of data in a pictorial or graphical format.
* It enables decision makers to see analytics presented visually
* Decision makers can then grasp difficult concepts or identify new patterns.
* With interactive visualization, you can take concepts further and teach concepts better.
  * You can drill down into charts and graphs for more detail,
  * and interactively change what data you see and how it’s processed.

#### Types of Visual Diagrams

A diagram is a symbolic representation of information according to some visualization technique.

#### Bar Charts

[Bar Chart](https://en.wikipedia.org/wiki/Bar_chart)

* A bar chart or bar graph is a chart or graph that presents categorical data with rectangular bars with heights or lengths proportional to the values that they represent.
* The bars can be plotted vertically or horizontally.
* A vertical bar chart is sometimes called a line graph.

{{< figure src="/media/bar-chart.png" >}}

#### Line Charts

[Line Chart](https://en.wikipedia.org/wiki/Line_chart)

* A line chart or line graph is a type of chart which displays information as a series of data points called 'markers' connected by straight line segments.
* It is a basic type of chart common in many fields.
* It is similar to a scatter plot except that the measurement points are ordered (typically by their x-axis value) and joined with straight line segments.
* A line chart is often used to visualize a trend in data over intervals of time – a time series – thus the line is often drawn chronologically.

{{< figure src="/media/line-chart.png" >}}

#### Scatter Plots

[Scatter Plots](https://en.wikipedia.org/wiki/Scatter_plot)

* A scatter plot (also called a scatter graph, scatter chart, scattergram, or scatter diagram) is a type of plot or mathematical diagram using Cartesian coordinates to display values for typically two variables for a set of data.
* If the points are color-coded, one additional variable can be displayed.
* The data is displayed as a collection of points, each having the value of one variable determining the position on the horizontal axis and the value of the other variable determining the position on the vertical axis

{{< figure src="/media/scatter-plot.png" >}}

## D3 API Docs

D3 4.0 is a [collection of modules](https://github.com/d3) that are designed to work together
* You can use the modules independently, or you can use them together as part of the default build.
* The source and documentation for each module is available in its repository.

Follow the links below to learn more:

* [Introduction](https://d3js.org/#introduction)
* [API Reference](https://github.com/d3/d3/blob/master/API.md)
* [Release Notes](https://github.com/d3/d3/blob/master/CHANGES.md)
* [Gallery](https://github.com/d3/d3/wiki/Gallery)
* [Examples](http://bl.ocks.org/mbostock)
* [Tutorials](https://github.com/d3/d3/wiki/Tutorials)
* [Plugins](https://github.com/d3/d3/wiki/Plugins)
* [d3.js on Stack Overflow](http://stackoverflow.com/questions/tagged/d3.js)
* [d3-js Google Group](http://groups.google.com/group/d3-js)
* [d3-js Slack Channel](https://d3js.slack.com) ([Invite](https://d3-slackin.herokuapp.com/))
* [d3-js Gitter Channel](https://gitter.im/d3/d3)
* d3-js IRC Channel => #d3.js on irc.freenode.net

#### List of D3 Modules

###### Data space

* query
 * d3-request
 * d3-queue

* generation
 * d3-random

* parsing
 * d3-dsv
 * d3-time

* formatting
 * d3-time-format
 * d3-format

* manipulation
 * d3-array
 * d3-collection


###### Graphic space

* data transform
 * d3-scale
 * d3-geo-projection

* geometry computation
 * d3-voronoi
 * d3-hull
 * d3-quadtree
 * d3-interpolate
 * d3-geo

* dynamic geometry computation
  * d3-transition
  * d3-timer
  * d3-ease

* visual variables mapping
 * d3-hierarchy
 * d3-sankey
 * d3-chord
 * d3-hexbin
 * d3-force

* generation
 * d3-shape
 * d3-path
 * d3-polygon

* converter
 * d3-color

###### View space

* visual variables mapping (selection, data-binding, attributes)
 * d3-selection
 * d3-selection-multi

* high level set of visual variables mapping (component)
 * d3-axis

###### Interaction space

* internal events
 * d3-dispatch

* user events and geometry computation
 * d3-zoom
 * d3-brush
 * d3-drag

## Selections and Data

[D3 Selections Documentation](https://github.com/d3/d3-selection)

* Selections are immutable.
* All selection methods that affect which elements are selected (or their order) return a new selection rather than modifying the current selection.
* However, note that elements are necessarily mutable, as selections drive transformations of the document!

[Selecting Elements](https://github.com/d3/d3-selection#selecting-elements)

```js
var anchor = d3.select("a");
```

This will select the first element that matches the specified selector string.

```js
const enter = svg.selectAll('rect')
```

This will select all elements that match the specified selector string

* If the selector is not a string, instead selects the specified array of nodes
* this is useful if you already have a reference to nodes, such as this.childNodes within an event listener or a global such as document.links

```js
d3.selectAll(document.links).style("color", "red");
```

```js
var even = d3.selectAll("tr").filter(":nth-child(even)");
```

Notice here that you can a css pseudo selector and you can also pass a function

```js
var even = d3.selectAll("tr").filter(function(d, i) { return i & 1; });
```

[Block Builder Editor](http://blockbuilder.org/)

* A very nice editor to build d3 visualizations that get saved as gists

* Click `START CODING` button
* Click Login and you will be routed to github page to authorize application
* You can then save your code here and get interactive editor

#### Playing with D3

[Playing with D3](http://blockbuilder.org/jbelmont/ccd655bb9c410190e305408bb93871b9)

#### Selections Demo

[Selections and Data Block Builder Demo](http://blockbuilder.org/jbelmont/f5c73b49d3478dfbb0135148fa04ad92)

[Selections Filter Demo](http://blockbuilder.org/jbelmont/e2017b083240255e42dffd515f9203d1)

[D3 Selections `attr`](https://github.com/d3/d3-selection#selection_attr)

* If a value is specified, sets the attribute with the specified name to the specified value on the selected elements and returns this selection.

* If the value is a constant, all elements are given the same attribute value

* Otherwise, if the value is a function, it is evaluated for each selected element, in order, being passed the current datum (d), the current index (i), and the current group (nodes), with this as the current DOM element (nodes[i]).

* The function’s return value is then used to set each element’s attribute. A null value will remove the specified attribute.

[D3 Selections `data`](https://github.com/d3/d3-selection#selection_data)

* Joins the specified array of data with the selected elements, returning a new selection that represents the update selection: the elements successfully bound to data

[D3 Selections `call`](https://github.com/d3/d3-selection#selection_call)

* Invokes the specified function exactly once, passing in this selection along with any optional arguments.

* Returns this selection. This is equivalent to invoking the function by hand but facilitates method chaining.

For example, to set several styles in a reusable function:

```js
function name(selection, first, last) {
  selection
      .attr("first-name", first)
      .attr("last-name", last);
}
```

[D3 Selections `text`](https://github.com/d3/d3-selection#selection_text)

* If a value is specified, sets the text content to the specified value on all selected elements, replacing any existing child elements.

* If the value is a constant, then all elements are given the same text content; otherwise, if the value is a function, it is evaluated for each selected element, in order, being passed the current datum (d), the current index (i), and the current group (nodes), with this as the current DOM element (nodes[i]).

* The function’s return value is then used to set each element’s text content. A null value will clear the content.

[D3 Selections `append`](https://github.com/d3/d3-selection#selection_append)

* If the specified type is a string, appends a new element of this type (tag name) as the last child of each selected element, or before the next following sibling in the update selection if this is an enter selection.

* The latter behavior for enter selections allows you to insert elements into the DOM in an order consistent with the new bound data; however, note that selection.order may still be required if updating elements change order (i.e., if the order of new data is inconsistent with old data).

* If the specified type is a function, it is evaluated for each selected element, in order, being passed the current datum (d), the current index (i), and the current group (nodes), with this as the current DOM element (nodes[i]). This function should return an element to be appended. (The function typically creates a new element, but it may instead return an existing element.)

For example, to append a DIV element to each paragraph:

`d3.selectAll("p").append("div");`

This is equivalent to:

```js
d3.selectAll("p").append(function() {
  return document.createElement("div");
});
```

Which is equivalent to:

```js
d3.selectAll("p").select(function() {
  return this.appendChild(document.createElement("div"));
});
```

[D3 style class attr and more play](http://blockbuilder.org/jbelmont/e991b69658afc57c5b8c4a0e9dd08fca)

## Enter and Append

[D3 Enter docs](https://github.com/d3/d3-selection#selection_enter)

`enter`:

* Returns the enter selection: placeholder nodes for each datum that had no corresponding DOM element in the selection.
* The enter selection is empty for selections not returned by selection.data.

* The enter selection is typically used to create “missing” elements corresponding to new data.
* For example, to create DIV elements from an array of numbers:

```js
const div = d3.select("body")
  .selectAll("div")
  .data([4, 8, 15, 16, 23, 42])
  .enter().append("div")
    .text(d => d);
```

* If the body is initially empty, the above code will create six new DIV elements, append them to the body in-order, and assign their text content as the associated (string-coerced) number:

```html
<div>4</div>
<div>8</div>
<div>15</div>
<div>16</div>
<div>23</div>
<div>42</div>
```

#### Enter and Append Demo

[Svg Enter and Append](http://blockbuilder.org/jbelmont/3e6a7ce02a072da3db8a4f77483b811f)

[SVG Enter Append Call](http://blockbuilder.org/jbelmont/d750c43050baf612a11c9bb42e62551b)

[Enter and Append with Circles](http://blockbuilder.org/jbelmont/03048c2bf48778b1d605345d7fdd6965)

[Enter and Append](http://blockbuilder.org/jbelmont/b3418f3b8f3f90f8de7bc59bc4aa3592)

**Click `Fork` Button to Play with this on your own**

[Enter and Append with Existing Rects](http://blockbuilder.org/jbelmont/bbc300e1ebe57b3f39477845a510eb33)

## SVG Basic Shapes

SVG Basic Shapes:

* Rectangle
* Circle
* Ellipse
* Straight Line
* Polyline
* Polygon
* Path

The basic shapes that SVG provides are:

* rectangle

* circle

* ellipse

* straight line

* polyline, polygon and path

#### Rectangles

```xml
<svg width="50" height="50">
    <rect x="0" y="0" width="50" height="50" />
</svg>
```

For us to be able to use an SVG rectangle it must be defined inside of the SVG tags.

The x and y - which is where the rectangle is drawn from and the height and width

The SVG coordinate space starts at the top left and goes to the bottom right as x and y coordinates increase.

So as the height increases, the rectangle will get longer down

And as the width increases, the rectangle will get longer to the right.

```js
var rectangles = [
  {"x": 0,   "y":   0, "width": 30, "height": 40},
  {"x": 50,  "y":  50, "width": 30, "height": 40},
  {"x": 100, "y": 100, "width": 30, "height": 40},
  {"x": 150, "y": 150, "width": 30, "height": 40}
];
```

```js
var svgContainer = d3.select("body")
  .append("svg")
  .attr("width","560")
  .attr("height","900");
```

```js
var svgRectangles = svgContainer
  .selectAll("rect")
  .data(rectangles)
  .enter()
  .append("rect");
```

This binds each JSON object to an SVG rectangle DOM element

```js
svgRectangles
    .attr("x",      function (d,i) { return d.x;  })
    .attr("y",      function (d,i) { return d.y;      })
    .attr("width",  function (d,i) { return d.width;  })
    .attr("height", function (d,i) { return d.height; });
```

We use an anonymous function to extract the relevant information from each JSON object
For the rectangle, this means the x, y, width and height information.

[D3 Rectangle in SVG](http://blockbuilder.org/jbelmont/f3cd7d0885e7a285021d5bfcb63c12eb)

#### Circles

```xml
<svg width="50" height="50">
    <circle cx="25" cy="25" r="25" />
</svg>
```

SVG circles must be defined inside of the SVG tags

The SVG circle takes in three main inputs:

* cx which is where the center of the circle is drawn from
* cy which is where the center of the circle is drawn from
* r which is the radius of the circle.

The JSON objects should have the cx, cy and r properties.

```js
var svgContainer = d3.select("body")
  .append("svg")
  .attr("width","560")
  .attr("height","900");
```

First, we define the SVG Container the rectangles will live in.

Note that we define the width and height of the SVG viewport container

```js
var circles = [
  {"cx":  25, "cy":  25, "r": 20},
  {"cx":  75, "cy":  75, "r": 20},
  {"cx": 125, "cy": 125, "r": 20},
  {"cx": 175, "cy": 175, "r": 20}
];
```

The circles array contains 4 circle JSON Objects.

This will be the data source used to construct the circles

```js
var svgCircles = svgContainer.selectAll("circle").data(circles).enter().append("circle");
```

This binds each JSON object to an SVG circle DOM element

```js
svgCircles
    .attr("cx", function (d,i) { return d.cx; })
    .attr("cy", function (d,i) { return d.cy; })
    .attr("r",  function (d,i) { return d.r;  });
```

We use an anonymous function to extract the relevant information from each JSON object

For the circle, this means the cx, cy and r information.

Bonus if you can set the first SVG Circle to Red Color

**Tip use the filter function with the svgCircles variable**

[D3 Circles in SVG](http://blockbuilder.org/jbelmont/99ffa83bcf299372014e743419cadc2d)

#### Ellipses

```xml
<svg width="50" height="50">
    <ellipse cx="25" cy="25" rx="15" ry="10" />
</svg>
```

SVG ellipses must be defined inside of the SVG tags.

The SVG ellipse takes in four main inputs:

* cx which is where the center of the ellipse is drawn from
* cy which is where the center of the ellipse is drawn from
* x radius of the ellipse
* y radius of the ellipse

The JSON object should have the cx, cy, rx and ry properties.

```js
var svgContainer = d3.select("body")
  .append("svg")
  .attr("width","560")
  .attr("height","900");
```

Here we define the SVG Container the ellipses will live in.

Note that we define the width and height of the SVG viewport container

```js
var ellipses = [
  {"cx":  25, "cy":  25, "rx": 15, "ry": 20},
  {"cx":  75, "cy":  75, "rx": 15, "ry": 20},
  {"cx": 125, "cy": 125, "rx": 15, "ry": 20},
  {"cx": 175, "cy": 175, "rx": 15, "ry": 20}
];
```

The ellipses array contains 4 ellipse JSON Objects.

This will be the data source used to construct the ellipses

```js
var svgEllipses = svgContainer
  .selectAll("ellipse")
  .data(ellipses)
  .enter()
  .append("ellipse");
```

```js
svgEllipses
    .attr("cx", function (d,i) { return d.cx; })
    .attr("cy", function (d,i) { return d.cy; })
    .attr("rx", function (d,i) { return d.rx; })
    .attr("ry", function (d,i) { return d.ry; });
```

We use an anonymous function to extract the relevant information from each JSON object

For the ellipse, this means the cx, cy, rx and ry information.

```js
d3.selectAll('ellipse').data()
```

This will return the data bound to each ellipse

```js
d3.selectAll('ellipse').nodes()
```

This will return each dom node for each ellipse

This binds each JSON object to an SVG ellipse DOM element

[D3 Ellipses in SVG](http://blockbuilder.org/jbelmont/d3461d2bc771d8e2d7bac18d192b6f4a)

#### Straight Lines

```xml
<svg width="50" height="50">
    <line x1="5" y1="5" x2="40" y2="40" stroke="gray" stroke-width="5" />
</svg>
```

SVG Straight Lines must be defined inside of the SVG tags.

The SVG Straight Line takes in six main inputs:

* x1 which is where the line starts
* y1 which is where the line starts
* x2 which is where the line ends
* y2 which is where the line ends
* stroke which is the color of the line
* stroke-width which is the stroke width

The stroke and stroke-width are necessary because an SVG line is dimensionless.

So by applying a stroke-width greater than zero, we can see the line.

The JSON object should have the x1, y1, x2, y2, stroke and stroke-width properties.

```js
var svgContainer = d3.select("body")
  .append("svg")
  .attr("width","200")
  .attr("height","200");
```

First, we define the SVG Container the straight lines will live in.

Note that we define the width and height of the SVG viewport container

```js
var straightLines = [
  { "x1":  0, "y1":  0, "x2": 40, "y2": 40, "stroke":"black", "stroke_width":5 },
  { "x1": 50, "y1": 50, "x2": 90, "y2": 90, "stroke":"black", "stroke_width":5 },
  { "x1":100, "y1":100, "x2":140, "y2":140, "stroke":"black", "stroke_width":5 },
  { "x1":150, "y1":150, "x2":190, "y2":190, "stroke":"black", "stroke_width":5 }
];
```

The straight lines array contains 4 straight line JSON Objects.

This will be the data source used to construct the straight lines

Note that for the stroke_width, we use an underscore to separate the stroke and width words

Why this is important will be seen shortly.

```js
var svgStraightLines = svgContainer
  .selectAll("line")
  .data(straightLines)
  .enter()
  .append("line");
```

This binds each JSON object to an SVG Straight Line DOM element

```js
svgStraightLines
    .attr("x1",           function (d,i) { return d.x1;           })
    .attr("y1",           function (d,i) { return d.y1;           })
    .attr("x2",           function (d,i) { return d.x2;           })
    .attr("y2",           function (d,i) { return d.y2;           })
    .attr("stroke",       function (d,i) { return d.stroke;       })
    .attr("stroke-width", function (d,i) { return d.stroke_width; });
```

We use an anonymous function to extract the relevant information from each JSON object

For the straight line, this means the x1, y1, x2, y2, stroke and stroke-width information.

Note, the stroke-width anonymous function uses the d.stroke {underscore} width.

If we have written stroke {dash} width, then JavaScript would have thought we were trying to do a subtraction.

This is very important to keep in mind as this can often cause bugs in the code.

[D3 Straight Lines in SVG](http://blockbuilder.org/jbelmont/be3d71e582388f97554a0656132b5755)

## Scales and Axis

[D3 Scales Docs](https://github.com/d3/d3-scale)

Key Functions:

[Scale Band](https://github.com/d3/d3-scale#scaleBand)

* Constructs a new band scale with the empty domain, the unit range [0, 1], no padding, no rounding and center alignment.

[Scale Linear](https://github.com/d3/d3-scale#scaleLinear)

* Constructs a new continuous scale with the unit domain [0, 1], the unit range [0, 1], the default interpolator and clamping disabled.

* Linear scales are a good default choice for continuous quantitative data because they preserve proportional differences.

* Each range value y can be expressed as a function of the domain value x: y = mx + b.

[D3 Continuous `domain`](https://github.com/d3/d3-scale#continuous_domain)

* If domain is specified, sets the scale’s domain to the specified array of numbers.
* The array must contain two or more elements.
* If the elements in the given array are not numbers, they will be coerced to numbers.
* If domain is not specified, returns a copy of the scale’s current domain.

```js
var color = d3.scaleLinear()
    .domain([-1, 0, 1])
    .range(["red", "white", "green"]);

color(-0.5); // "rgb(255, 128, 128)"
color(+0.5); // "rgb(128, 192, 128)"
```

[D3 Axis Docs](https://github.com/d3/d3-scale)

[Scales and Axis](http://blockbuilder.org/jbelmont/96f2c14132fb446e839ef8fd9e517267)

Notice in this file that I make a call to `d3.csv`

[d3 request docs for csv and tsv files](https://github.com/d3/d3-request#csv)

* Returns a new request for the CSV file at the specified url with the default mime type text/csv.
* If no callback is specified, this is equivalent to:

```js
d3.request(url)
    .mimeType("text/csv")
    .response(function(xhr) { return d3.csvParse(xhr.responseText, row); });
```

```js
d3.request(url)
    .mimeType("text/csv")
    .response(function(xhr) { return d3.csvParse(xhr.responseText, row); })
    .get(callback);
```

Here is our function in the blockbuilder file

```js
// dataset for city demographics by city
d3.csv('demographic-states-by-city.csv', (err, data) => {
  data.forEach(d => {
    d[COUNT_HISPANICS] = Number(d[COUNT_HISPANICS]) + 0; // y
  });

  // get min/max
  var min = d3.min(data, d => d[COUNT_HISPANICS]);
  var max = d3.max(data, d => d[COUNT_HISPANICS]);
  // or use extent, which gives back [min, max]
  const extent = d3.extent(data, d => d[COUNT_HISPANICS]);

  // try different scales, change the ranges, see what happens
  const yScale = d3.scaleLinear()
    .domain(extent)
    .range([height, 0]);

  // try passing in tick valuess
  const yAxis = d3.axisLeft()
    .scale(yScale);

  const axis = d3.select('svg').append('g')
    .attr('transform', 'translate(40, 20)')
    .call(yAxis);

  const text = axis.selectAll('text')
    .attr('fill', d => d === 35 ? 'blue' : 'green')
});
```

`d3.csv(url, row, callback);`

Notice we provided a url and a callback but not `row`

#### D3 scale and axis methods

[D3 array method `extent`](https://github.com/d3/d3-array#extent)

* Returns the minimum and maximum value in the given array using natural order.

* If the array is empty, returns [undefined, undefined].

* An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the extent.

[D3 scale method `scaleTime`](https://github.com/d3/d3-scale#scaleTime)

* Constructs a new time scale with the domain [2000-01-01, 2000-01-02]
  * the unit range [0, 1], the default interpolator and clamping disabled.

[D3 axis method `axisBottom`](https://github.com/d3/d3-axis#axisBottom)

* Constructs a new bottom-oriented axis generator for the given scale, with empty tick arguments, a tick size of 6 and padding of 3.
* In this orientation, ticks are drawn below the horizontal domain path.

[Introduction to D3 Scales by Mike Bostock](https://medium.com/@mbostock/introducing-d3-scale-61980c51545f)

**Click `Fork` Button to Play with this on your own**

## Shapes

{{< figure src="/media/shapes.png" >}}

#### SVG Elements

[SVG Paths](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths)

[SVG Transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform)

#### Path Attribute

* `d3-shape` calculates the path attribute

Imagine if you had to hand code this:

```xml
<svg width="190" height="160" xmlns="http://www.w3.org/2000/svg">

  <path d="M10 10 C 20 20, 40 20, 50 10" stroke="black" fill="transparent"/>
  <path d="M70 10 C 70 20, 120 20, 120 10" stroke="black" fill="transparent"/>
  <path d="M130 10 C 120 20, 180 20, 170 10" stroke="black" fill="transparent"/>
  <path d="M10 60 C 20 80, 40 80, 50 60" stroke="black" fill="transparent"/>
  <path d="M70 60 C 70 80, 110 80, 110 60" stroke="black" fill="transparent"/>
  <path d="M130 60 C 120 80, 180 80, 170 60" stroke="black" fill="transparent"/>
  <path d="M10 110 C 20 140, 40 140, 50 110" stroke="black" fill="transparent"/>
  <path d="M70 110 C 70 140, 110 140, 110 110" stroke="black" fill="transparent"/>
  <path d="M130 110 C 120 140, 180 140, 170 110" stroke="black" fill="transparent"/>

</svg>
```

{{< figure src="/media/bostock-line-chart.png" >}}

#### Pie

[Pie Chart](https://github.com/d3/d3-shape#pies)

* The pie generator does not produce a shape directly, but instead computes the necessary angles to represent a tabular dataset as a pie or donut chart
* These angles can then be passed to an arc generator

[D3 shape `pie` method](https://github.com/d3/d3-shape#pie)

* Constructs a new pie generator with the default settings.

[D3 shape `arc` method](https://github.com/d3/d3-shape#arc)

* Constructs a new arc generator with the default settings.

[D3 shape `arc` with args method](https://github.com/d3/d3-shape#_arc)

If the radii and angles are instead defined as constants, you can generate an arc without any arguments:

```js
var arc = d3.arc()
    .innerRadius(0)
    .outerRadius(100)
    .startAngle(0)
    .endAngle(Math.PI / 2);

arc(); // "M0,-100A100,100,0,0,1,100,0L0,0Z"
```

[Area Chart](http://blockbuilder.org/jbelmont/fa75876b679907a613d61805c37231a8)

## Enter and Update

[Mikes Blog Post on Object Constancy](https://bost.ocks.org/mike/constancy/)

> Animated transitions are pretty, but they also serve a purpose: they make it easier to follow the data. This is known as object constancy: a graphical element that represents a particular data point (such as Ohio) can be tracked visually through the transition. This lessens the cognitive burden by using preattentive processing of motion rather than sequential scanning of labels.

* To achieve object constancy with D3.js, specify a key function as the second argument to selection.data.
* This function takes a data point as input and returns a corresponding key: a string, such as a name, that uniquely identifies the data point.

For example, the bar chart above defines data as objects:

```json
{
  "State": "ND",
  "Total": 641481,
  "Under 5 Years": 0.065,
  "5 to 13 Years": 0.105,
  "14 to 17 Years": 0.053,
  "18 to 24 Years": 0.129,
  "16 Years and Over": 0.804,
  "18 Years and Over": 0.777,
  "15 to 44 Years": 0.410,
  "45 to 64 Years": 0.260,
  "65 Years and Over": 0.147,
  "85 Years and Over": 0.028
}
```

with a suitable key function

```js
function key(d) {
  return d.State;
}
```

#### Thinking with Joins

[Mike Bostock's Blog Post on Thinking with Joins](https://bost.ocks.org/mike/join/)

{{< figure src="/media/three-circles.png" >}}

* Data points joined to existing elements produce the update (inner) selection.
* Leftover unbound data produce the enter selection (left), which represents missing elements.
* Likewise, any remaining unbound elements produce the exit selection (right), which represents elements to be removed.

`Now we can unravel the mysterious enter-append sequence through the data join`:

1. First, svg.selectAll("circle") returns a new empty selection, since the SVG container was empty. The parent node of this selection is the SVG container.

2. This selection is then joined to an array of data, resulting in three new selections that represent the three possible states: enter, update, and exit. Since the selection was empty, the update and exit selections are empty, while the enter selection contains a placeholder for each new datum.

3. The update selection is returned by selection.data, while the enter and exit selections hang off the update selection; selection.enter thus returns the enter selection.

4. The missing elements are added to the SVG container by calling selection.append on the enter selection. This appends a new circle for each data point to the SVG

## Exit and Merge

[Enter and Update](http://blockbuilder.org/jbelmont/2ebf2c68f53b86fd77b8d318bfb668a0)

## Transitions

* A transition is a selection-like interface for animating changes to the DOM.
* Instead of applying changes instantaneously, transitions smoothly interpolate the DOM from its current state to the desired target state over a given duration.

To apply a transition, select elements, call selection.transition, and then make the desired changes.

For example:

```js
d3.select("body")
  .transition()
    .style("background-color", "red");
```

* Transitions are derived from selections via selection.transition.
* You can also create a transition on the document root element using d3.transition.

[selection.transition](https://github.com/d3/d3-transition#selection_transition)

* Returns a new transition on the given selection with the specified name.
* If a name is not specified, null is used.
* The new transition is only exclusive with other transitions of the same name.

```js
var t = d3.transition()
    .duration(750)
    .ease(d3.easeLinear);

d3.selectAll(".apple").transition(t)
    .style("fill", "red");

d3.selectAll(".orange").transition(t)
    .style("fill", "orange");
```

[Circle Transitions](http://blockbuilder.org/jbelmont/dd2b58748e79855d1baa9d11fb76cef8)

**Click `Fork` Button to Play with this on your own**

## Force Layout

[Force Layout Docs](https://github.com/d3/d3-force)

In the domain of information visualization, physical simulations are useful for studying networks and hierarchies!

{{< figure src="/media/force-dragging.png" >}}

Force Layout is good at providing insights on the relationships between connections

[d3 force layout guide](http://d3indepth.com/force-layout/)

**To give credit where it is due, the following content below is derived from the above url**

D3 force layout uses a physics based simulator for positioning visual elements.

Forces can be set up between elements, For example:

* all elements repel one another

* elements are attracted to center(s) of gravity

* linked elements are a fixed distance apart (network visualisation)

* elements may not overlap (collision detection)

#### Force Simulation

There are 4 steps in setting up force simulation:

1. Create an array of objects

2. Call forceSimulation, passing in the array of objects.

3. Add one or more force functions (forceManyBody, forceCenter, forceCollide, etc) to the system

4. Set up callback function to update the element positions after each tick.

```js
const dimensions = {
  width: 300,
  height: 300
};

const nodes = [{}, {}, {}, {}, {}];

let simulation = d3.forceSimulation(nodes)
  .force('charge', d3.forceManyBody())
  .force('center', d3.forceCenter(dimensions.width / 2, dimensions.height / 2))
  .on('tick', ticked);

function ticked() {
  var u = d3.select('svg')
    .selectAll('circle')
    .data(nodes)

  u.enter()
    .append('circle')
    .attr('r', 5)
    .merge(u)
    .attr('cx', function(d) {
      return d.x
    })
    .attr('cy', function(d) {
      return d.y
    })

  u.exit().remove()
}
```

#### D3 Force Functions

Force functions are added to the simulation using .force() where the first argument is a user defined id and the second argument the force function:

```js
simulation.force('charge', d3.forceManyBody())
```

#### forceCenter

* [forceCenter](https://github.com/d3/d3-force#forceCenter) (for setting the center of gravity of the system)

Creates a new centering force with the specified x- and y- coordinates.
If x and y are not specified, they default to ⟨0,0⟩.

forceCenter is useful (if not essential) for centering your elements as a whole about a center point. (Without it elements might disappear off the page.)

Initialis with a center position:

`d3.forceCenter(100, 100)`

or using the configuration functions .x() and .y():

`d3.forceCenter().x(100).y(100)`

`simulation.force('center', d3.forceCenter(100, 100))`

#### forceManyBody

* [forceManyBody](https://github.com/d3/d3-force#forceManyBody) (for making elements attract or repel one another)

Creates a new many-body force with the default parameters.

forceManyBody causes all elements to attract or repel one another.
The strength of the attraction or repulsion can be set using .strength() where a positive value will cause elements to attract one another while a negative value causes elements to repel each other.
The default value is -30.

`simulation.force('charge', d3.forceManyBody().strength(-20))`

#### forceCollide

* [forceCollide](https://github.com/d3/d3-force#forceCollide) (for preventing elements overlapping)

Creates a new circle collision force with the specified radius.
If radius is not specified, it defaults to the constant one for all nodes.

forceCollide is used to stop elements overlapping and is useful when ‘clumping’ circles together.

We must specify the radius of the elements using .radius():

```js
var numNodes = 100
var nodes = d3.range(numNodes).map(function(d) {
  return {radius: Math.random() * 25}
})

var simulation = d3.forceSimulation(nodes)
  .force('charge', d3.forceManyBody().strength(5))
  .force('center', d3.forceCenter(width / 2, height / 2))
  .force('collision', d3.forceCollide().radius(function(d) {
    return d.radius
  }))
```

### forceX and forceY

forceX and forceY cause elements to be attracted towards specified position(s).

#### forceX

* [forceX](https://github.com/d3/d3-force#forceX) for attracting elements to a given point

Creates a new positioning force along the x-axis towards the given position x.
If x is not specified, it defaults to 0.

```js
simulation.force('x', d3.forceX().x(function(d) {
  return xCenter[d.category];
}));
```

#### forceY

* [forceY](https://github.com/d3/d3-force#forceY) for attracting elements to a given point

Creates a new positioning force along the y-axis towards the given position y.
If y is not specified, it defaults to 0.

#### forceLink

* [forceLink](https://github.com/d3/d3-force#forceLink) for creating a fixed distance between connected elements

Creates a new link force with the specified links and default parameters.
If links is not specified, it defaults to the empty array.

* forceLink pushes linked elements to be a fixed distance apart.
* It requires an array of links that specify which elements we want to link together. * Each link object specifies a source and target element, where the value is the element’s array index:

```js
var links = [
  {source: 0, target: 1},
  {source: 0, target: 2},
  {source: 0, target: 3},
  {source: 1, target: 6},
  {source: 3, target: 4},
  {source: 3, target: 7},
  {source: 4, target: 5},
  {source: 4, target: 7}
]
```

We pass our links array into the forceLink function using .links():

`simulation.force('link', d3.forceLink().links(links))`

**Once again all credit for this content goes to [d3indepth.com/force-layout/](http://d3indepth.com/force-layout/)**

#### Force Layout

[Force Layout](https://bl.ocks.org/mbostock/ad70335eeef6d167bc36fd3c04378048)

[Force Layout Forked Demo](http://blockbuilder.org/jbelmont/1aab97d586c87c2872b0ceeaa7769773)

## D3 and Vuejs

[D3 and Vuejs jsFiddle](https://jsfiddle.net/jbelmont/peb26h33/8/)

## Data Visualization Best Practices

There is a wonderful illustration in this [Tableau White Paper](https://www.tableau.com/sites/default/files/media/whitepaper_visual-analysis-guidebook_0.pdf) on Data Visualization Best Practices

## General Data Visualization Resources

* **[Dashing D3js](https://www.dashingd3js.com/table-of-contents)**
* **[Visualizing Data](http://www.visualisingdata.com)** - a fantastic blog about data visualization.
* **[Flowing Data](http://flowingdata.com)** - another data visualization blog.
* **[Information Aesthetics](http://infosthetics.com)** - Another good blog.
* **[Shirley Wu](http://sxywu.com/)** - Excellent blog on Data Visualization.

### Data Visualization Experts and Companies
* **[Jer Thorp](http://blog.blprnt.com)** - Data artist.
* **[Nicolas Feltron](http://feltron.tumblr.com)** - Data artist.
* **[Stamen](http://stamen.com)** - Data visualization company, excellent blog, heavy focus on maps.
* **[Fathom](http://fathom.info/latest/)** - Another interesting data visualization company.

## Gitbook Link

[D3 Data Visualization Gitbook](https://www.marcelbelmont.com/data-visualization-workshop/)

## Github Repo

If you like this information please get more details and challenges at [Data Visualization Workshop](https://github.com/jbelmont/data-visualization-workshop) and star the repository.