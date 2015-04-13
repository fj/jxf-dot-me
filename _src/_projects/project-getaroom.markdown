---
title:  hotel booking API design, development, and scaling
client: Getaroom.com / Hilton Hotels and Resorts
image: portfolio-getaroom.jpg
date_range: "2010"
tags:
  - travel
  - api
  - xml
  - ruby
  - scalability
  - web
---

[Getaroom.com](http://getaroom.com) is a hotel-booking service that saves travelers money by offering privately negotiated rates below the publicly-advertised rates for hotel rooms. Customers visit the site or call a toll-free number to inquire about availability and book their rooms. The business model proved very popular, and the timing was fortuitous because the 2007-2010 recession was under way; hotel prices are one of the first places to take a hit in recessions.

Getaroom's architecture was fascinating because they have to serve a lot of different stakeholders: customers that book rooms, employees who must navigate the internals of the booking systems for each hotel chain as well as Getaroom's systems, and engineers who need to optimize the platform for maximum speed and performance. Building a technology infrastructure that serves many stakeholders is very hard to do correctly and I think it's still one of the best examples I've come across.

I was asked to build and consult on a B2B API for Getaroom in partnership with Hilton Hotels and Resorts, a US$10 billion revenue provider of hotel lodging. Getaroom wanted to interface with Hilton's large portfolio of about 700,000 rooms, but Hilton's API at the time was a little clunky for travel-business consumers. We successfully built a much nicer Ruby wrapper around the legacy SOAP/XML stream, and the first Hilton API call was made on August 10, 2010. It gradually grew to become a major part of Getaroom's revenue stream. As of 2014, Getaroom was projected to earn about [US$150M in revenue](http://www.bizjournals.com/dallas/print-edition/2012/11/16/no-4-call-center-adds-to-getarooms.html?page=all).