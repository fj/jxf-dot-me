---
layout:        post
title:         See Everything in Action with a Really Long Post Title
date:          2014-11-09 12:36:06
nav_highlight: blog
icon_type:     post
description:   See what the different elements looks like. Your markdown has never looked better. I promise.
tags:          jekyll pixyll
---

There is a significant amount of subtle, yet precisely calibrated, styling to ensure
that your content is emphasized while still looking aesthetically pleasing.

All links are easy to [locate and discern](#), yet don't detract from the harmony
of a paragraph. The same goes for _emphasized_ and __bold__ elements. Even the the strikeout
works if <del>for some reason you need to update your post</del>. For consistency's sake,
<ins>the same goes for insertions</ins>, of course.

Pellentesque porttitor blandit malesuada. Vestibulum facilisis elit ut suscipit eleifend. Donec egestas tortor
felis, id consectetur lorem aliquet mattis. In laoreet in est sit amet consequat. Maecenas efficitur posuere
est, ornare aliquet nibh faucibus a. Phasellus gravida ipsum nisl. In venenatis aliquet purus ac interdum.

<aside>
  This is an example of an aside. It's pretty neat. It floats right, and never takes up more than
  40% of the width.
</aside>

Maecenas varius mi vel ante pulvinar aliquam. Aenean scelerisque consequat tristique. Quisque quam turpis,
mollis sit amet elit suscipit, faucibus congue ligula. Proin fermentum volutpat sapien, vel dignissim ligula
eleifend vel. Aenean commodo porta turpis, vitae viverra magna. In vestibulum vestibulum rhoncus.

### Code, with syntax highlighting

Code blocks are syntax highlighted out of the box, you just need to specify the language with
the Jekyll highlight block: `{{ "{%" }} highlight ruby %}` and close it with
`{{ "{%" }} endhighlight %}`.

{% highlight ruby %}
class Awesome < ActiveRecord::Base
  include EvenMoreAwesome

  validates_presence_of :something, :another_thing, :even_another_thing, :this_is_a_really_long_line_of_code
  validates :email, email_format: true

  def initialize(email, name = nil)
    self.email = email
    self.name = name
  end
end
{% endhighlight %}

You can specify code blocks with captions, too:

{% highlight ruby %}
class Awesome < ActiveRecord::Base
  include EvenMoreAwesome

  validates_presence_of :something
  validates :email, email_format: true

  def initialize(email, name = nil)
    self.email = email
    self.name = name
  end
end
{% endhighlight %}
<div class="caption">
  This is a code block that illustrates a code caption <code>&lt;div class="caption"&gt;</code>
</div>

This is an example paragraph following the caption. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eleifend, massa non sollicitudin elementum, erat ante viverra massa, sit amet consequat urna risus in dolor. Proin tincidunt ullamcorper odio eget elementum.

### There are lists, too

  * Apples
  * Citrus
    * Grapefruit
    * Limes
  * Potatoes
  * Milk

  1. Mow the lawn
  2. Feed the dog
  3. Dance

# Headings!

They're responsive, and well-proportioned (in `padding`, `line-height`, `margin`, and `font-size`).
They also heavily rely on the awesome utility, [BASSCSS](http://www.basscss.com/).

##### They draw the perfect amount of attention

This allows your content to have the proper informational and contextual hierarchy. Yay.

### Images look great, too

Images are 100% responsive.

![desk](https://cloud.githubusercontent.com/assets/1424573/3378137/abac6d7c-fbe6-11e3-8e09-55745b6a8176.png)

This is an image that's less than 100% width:

![tree](https://cloud.githubusercontent.com/assets/1424573/5351205/97978a2c-7f0f-11e4-936f-8e227e778a56.png)

The following image has a caption:

![tree in water](https://unsplash.imgix.net/reserve/z7R1rjT6RhmZdqWbM5hg_R0001139.jpg?q=75&fm=jpg&s=26fc77c65835d1d8e2bcffb8b91a1b93)

<div class="caption">
  This is an image courtesy of <a href="http://unsplash.com">unsplash</a>.
</div>

This is an example paragraph following the caption. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eleifend, massa non sollicitudin elementum, erat ante viverra massa, sit amet consequat urna risus in dolor. Proin tincidunt ullamcorper odio eget elementum.

### Blockquotes

You can use the markdown quote syntax, `>` for simple quotes.

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis porta mauris.

However, you need to inject html if you'd like a citation footer. I will be working on a way to
hopefully sidestep this inconvenience.

<blockquote>
  <p>
    Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.
  </p>
  <footer><cite title="Antoine de Saint-Exupéry">Antoine de Saint-Exupéry</cite></footer>
</blockquote>
