---
title:  National Emissions Inventory System
client: United States Environmental Protection Agency
image: portfolio-eis.jpg
date_range: "2007 - 2009"
tags:
  - environment
  - java
  - scalability
  - web
---

EIS is the world's largest [emissions inventory database](http://www.epa.gov/ttnchie1/eiinformation.html), and is managed by the tireless efforts of the [U.S. Environmental Protection Agency](http://www.epa.gov/). An emissions inventory is a collection of data and metadata about pollution of different kinds. Sometimes this pollution is natural, like ash from forest fires or ozone from lightning strikes; other times it's the result of manmade activities, like driving cars or generating power. But all of it has to be tracked to get a complete picture of how pollution affects us.

Every three years, an enormous partnership of cities, counties, states, and industries across the US submit accumulated metadata about the emissions under their jurisdiction. The resulting summary dataset constructed by EIS, called the [National Emissions Inventory](http://www.epa.gov/ttnchie1/trends/), is used by climatologists, academics, and policymakers to understand how pollution affects all of us, and to develop strategies for minimizing or eliminating its harm. For example, [this map](https://www.google.com/fusiontables/embedviz?q=select+col11%3E%3E1+from+1MbfW4aAKSaPA2syificqjl59V7XNq1L5SDKb9h9n&viz=MAP&h=false&lat=50.61151051153665&lng=-75.32618750000002&t=1&z=3&l=col11%3E%3E1&y=2&tmplt=2&hml=TWO_COL_LAT_LNG) shows every location in the US that emits [tetrachloroethylene](http://en.wikipedia.org/wiki/Tetrachloroethylene), a toxic carcinogen and organic solvent with widespread industrial applications.

My team built the modern EIS still in use today, transitioning the agency away from a system where sensitive data was reported by shipping CDs around. It's an enormous Java web application which contains hundreds of data integrity checks and stores terabytes of data, culminating in a system that represents a century's experience of expert knowledge in the air emissions domain.