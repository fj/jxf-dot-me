---
type:        lecture
title:       "Papers We Love DC: Coresets"
date:        2015-03-05
description: >
  Discussing Dan Feldman's Ph.D. thesis, "Coresets and their applications".
---

I'll be speaking at the [Papers We Love DC](http://www.meetup.com/Papers-We-Love-DC/events/220155410/) meetup. We're covering the Ph.D. thesis of the head of the MIT Robotics and Big Data Lab, Dan Feldman; it's entitled ["Coresets and their applications"](http://www.cs.tau.ac.il/thesis/thesis/feldman). That's "coresets" as in the mathematical reduction technique, not "corsets" as in the article of clothing.

**Coresets** are a way of turning large datasets into much smaller, more manageable sets in a way that preserves the interesting features ofthe larger set. Approximation isn't a new technique; we compress datasets all the time to preserve interesting features (JPEGs for pictures, MP4 for audio, etc.). The choice of the way in which you construct the coreset determines which interesting features are (or are not) preserved, and within what error bounds.

The surprising result is that you can, very frequently, throw away large parts of your dataset still get good approximations to the optimal answer. This is valuable for cases where you want to ask an expensive question on a large dataset (e.g. Hamiltonian tours /Traveling Salesperson problem, convex hull, etc.) when you're willing to trade off some fidelity in the answer for response speed.
