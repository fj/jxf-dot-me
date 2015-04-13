---
title:  VisionMaster FT ECDIS-E
client: Northrop Grumman
image: portfolio-northrop-grumman-ecdis.jpg
date_range: "2006 - 2007"
tags:
  - navigation
  - geospatial
  - hardware
  - csharp
  - performance
---

Marine transport and defense are vital to the national security and economy of many developed countries. To make the world's vast network of shipping lanes and naval defense safe and reliable, precise and accurate navigational charts are required. Because of the risk of damage or loss to paper charts, the International Maritime Organization requires certain ship classes to be equipped with mandatory electronic chart display and information systems (ECDIS). Northrop Grumman was working on a project to provide a next-generation digital mapping solution to meet ships that fell under the new IMO restrictions -- a piece of hardware that could be installed on the bridge of any compliant ship and provide real-time navigational data.

I was retained to optimize and improve their existing codebase and audit it for technical debt. I was also asked to devise improvements to the accuracy of the wayfinding algorithms already in place, which I did by implementing a complex but precise method for calculating distances called the [Vincenty solutions](http://www.ngs.noaa.gov/PUBS_LIB/inverse.pdf). (Thaddeus Vincenty was a Polish-American geodesist who computed a general method of finding the distance between any two points on an ellipsoid, which is very useful if you happen to be living on something that's approximately an ellipsoid, like the billions of inhabitants of Earth do.) The result was that the navigational error on long-range waypoints decreased by several orders of magnitude -- the difference between being a few kilometers off and a few millimeters off.

The successful end result was [Northrop Grumman's VisionMaster FT ECDIS-E](http://www.sperrymarine.com/visionmaster-ft-ecdis). It's still in use today and routinely wins contracts, especially on a number of major cruise and transport vessels. The next time you're on a big ship, see if you can get a tour of the bridge, and look for the ECDIS system - it might be a VisionMaster!