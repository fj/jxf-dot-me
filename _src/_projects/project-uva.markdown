---
title:  Asterisk PBX telephony architecture
client: University of Virginia
image: portfolio-uva.jpg
date_range: "2006"
tags:
  - telephony
  - hardware
  - c
  - python
  - scalability
  - web
---

The University of Virginia is a leading public institution and consistently ranks among the [top three public universities](http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/top-public) in the United States. Like all organizations, they have a technical infrastructure that sometimes has trouble keeping up with their growth rate.

In 1984, the University installed a new University-wide analog phone system, which was then partially upgraded again in 1996. Eventually, however, things started to show their age: the network was gradually becoming overloaded and it was tough to expand telephony services for the University's many power users.

Digital telephony over VOIP was becoming more popular at the time as analog networks were deprecated, and private branch exchanges (PBXs) for large organizations were becoming a de facto requirement for managing telephony services. A PBX is analogous to a network router for phone systems -- it services a local phone network and connects it to the broader public switched telephone network, or PSTN. Without a PBX, each phone would need a direct connection to the PSTN, which would be massively expensive and wasteful -- most organizational calls are internal and don't need a direct connection, and most telephony capacity goes unused at any given moment.

I was asked to consult and advise on a private branch exchange (PBX) VOIP system for the University's Information Technology Services department during an exploratory testing for the next-generation phone system. I built a simple Asterisk VOIP server from scratch capable of routing and connecting up to 6,000 simultaneous SIP calls. Seven years later and after several testing rounds, ITS eventually began [phasing out analog systems](http://its.virginia.edu/telephone/updates.html) University-wide and [the replacement effort is now underway](http://its.virginia.edu/telephone/).