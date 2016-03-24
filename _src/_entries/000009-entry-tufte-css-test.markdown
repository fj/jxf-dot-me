---
type:         post
title:        "Tufte-CSS Test"
date:         2016-03-14T10:00:00Z
published:    true
tags:
  - pivotal
  - work
description: >
  Tufte-CSS Test
---

Tufte CSS provides tools to style web articles using the ideas demonstrated by Edward Tufte’s books and handouts. Tufte’s style is known for its simplicity, extensive use of sidenotes, tight integration of graphics with text, and carefully chosen typography.

# Side Notes

One of the most distinctive features of Tufte’s style is his extensive use of sidenotes.{% sidenote %}This is a sidenote."{% endsidenote %} Sidenotes are like footnotes, except they don’t force the reader to jump their eye to the bottom of the page, but instead display off to the side in the margin.{% sidenote test-ref%}This is a sidenote with a **custom reference**."{% endsidenote %} Perhaps you have noticed their use in this document already.

Lorem ipsum dolor sit amet, consectetur adipisicing elit.{% sidenote %}This is another sidenote *without* a reference to demonstrate that it is optional{% endsidenote %} Eaque quo aspernatur dolor sed voluptate repudiandae inventore deleniti commodi reprehenderit fugit, animi doloremque obcaecati, dolores debitis, quis porro? Assumenda, nisi, tenetur!

# Margin Notes

If you want a sidenote without footnote-style numberings, then you want a margin note.{% margin %}This is a margin note{% endmargin %} Notice there isn’t a number preceding the note. On large screens, a margin note is just a sidenote that omits the reference number. This lessens the distracting effect taking away from the flow of the main text, but can increase the cognitive load of matching a margin note to its referent text. However, on small screens, a margin note is like a sidenote except its viewability-toggle is a symbol rather than a reference number. This document currently uses the symbol ⊕ (&#8853;), but it’s up to you.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut eligendi, aut earum in sapiente a laboriosam impedit cupiditate quos quam laudantium, delectus possimus.{% margin %}This is another margin note{% endmargin %}

# Margin Notes With Images and HTML

Tufte emphasizes tight integration of graphics with text. Data, graphs, and figures are kept with the text that discusses them. In print, this means they are not relegated to a separate page. On the web, that means readability of graphics and their accompanying text without extra clicks, tab-switching, or scrolling.

{% margin %}
<img src="https://edwardtufte.github.io/tufte-css/img/rhino.png" alt="Image of a Rhinoceros"/>F.J. Cole, “The History of Albrecht Dürer’s Rhinoceros in Zooological Literature,” <em>Science, Medicine, and History: Essays on the Evolution of Scientific Thought and Medical Practice</em> (London, 1953), ed. E. Ashworth Underwood, 337-356. From page 71 of Edward Tufte’s <em>Visual Explanations</em>.
{% endmargin %}
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore facilis ipsa optio modi, voluptate temporibus impedit perferendis vitae recusandae quidem, explicabo laudantium at dolorem beatae illum est fuga voluptatibus quis error dignissimos illo accusamus vel incidunt vero cumque? Ipsum recusandae culpa est ratione nulla voluptatum rerum assumenda deserunt eum perspiciatis!
