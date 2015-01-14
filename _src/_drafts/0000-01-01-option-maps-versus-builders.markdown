---
type:         post
title:        "Option Maps or Builders?"
date:         2015-02-11 12:00:00
tags:         api
description: >
  Comparing two strategies for fluent interfaces.
---

https://lobste.rs/s/ezit2o/returning_self_or_void_suggests_mutability/comments/8bbym4#c_8bbym4

Let's say you have some code that looks like this:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
{% endhighlight %}
