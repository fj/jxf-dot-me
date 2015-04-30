---
type:         post
title:        "The Infinity Zoo: What is Infinity?"
date:         2015-04-24T08:00:00Z
tags:
  - math
  - numbers
description: >
  Exploring the nature of infinity. What does infinity mean?
---

> <div style="white-space: pre">To see a world in a grain of sand,
>   And Heaven in a wild flower,
> Hold Infinity in the palm of your hand,
>   And Eternity in an hour.</div>
> 
> William Blake, "Auguries of Innocence"

Infinity is an idea that has fascinated humans for a long time. To some it can seem inscrutable. For others, it symbolizes the mystical or spiritual. For mathematicians, it's a tool that's essential to working with and understanding the behavior of many things -- although it's been a point of strong historical controversy.

But what _is_ infinity, exactly? It turns out there are many kinds and instances of infinity -- a veritable zoo of infinities! In this post, we'll try to do a survey of the different kinds of infinity, and explore some of the possibilities that are enabled by having it.

# Actual and potential infinity

![a perspective shot of a building in Toronto stretching into the sky]({{ page.image_path }}/toronto-skyscraper.jpg)

A tower in Toronto's financial district stretches high into the evening sky. [Source.](https://flic.kr/p/nDw3D3)
{:.caption}

People have been grappling with the philosophy of infinity for centuries, and mathematics is no exception. The ancients, especially Indian, Greek, and Arab mathematicians, readily entertained the notion of two kinds of infinity. One kind was called _potential infinity_; the Greeks called it [apeiron](http://en.wikipedia.org/wiki/Apeiron_%28cosmology%29) (ἄπειρον, "without end"). The other kind was called _actual infinity_.

![diagram describing potential infinity]({{ page.image_path }}/chart-entry-potential-infinity.png)

Potential infinity allows a process to be repeated as many times as you would like -- for example, adding a new number to a list -- but no matter when you stop, the result is always finite.
{:.caption}

Essentially, a potential infinity describes two things: a bag that holds items, and a process that adds items to the bag which can be repeated indefinitely.

You may keep adding items to the bag as long you like via the process. But you'll never exhaust the supply of elements you can add -- it has no end. If you do stop at some point, you will always have a finite number of items in the bag. In other words, the _potential_ infinity is never realized into true infinity, so a crisis is averted.

But true, _actual infinity_ eluded their grasp somewhat. An _actual infinity_, in their view, was like a bag that contains not merely _many_ items, but _infinitely many_ -- an unlimited, unbounded number. This was a somewhat radical idea. Plato, for example, objected strongly to actual infinities -- how could something be so big that it contained everything, and yet fit inside the Universe?

Actual infinity was difficult to grasp, and controversial from the beginning. It took two millenia before the notion of actual infinity as a real, useful property began to take root in mainstream mathematics.

# 9999$$ \cdots $$ problems

To see why it was so controversial, let's reflect for a moment on the meanings of infinity.

Sometimes we use infinity to mean something like "an incomprehensibly big quantity", like the number of stars in the sky, grains of sand on a beach, or atoms in the Universe. These are indeed very big numbers, in the sense that it would take you a long time to count them out, but they aren't _infinite_. They are large -- for example, the number of atoms in the Universe is about $$ 10^{80} $$ -- but nevertheless they are finite. For mathematicians, the unsatisfactory imprecision of phrases like "big number" or "a long time" renders them useless for making rigorous statements about the world. This use of the word "infinite" is a meaningless one.

Another problem is that there seem to be many kinds of infinities. The single word "infinity" fails to capture the diversity and depth of these concepts, much like the word "number" fails to capture the many different kinds of numbers. Even the ancients already distinguished at least two kinds of infinities, the actual and potential infinities. There are certainly many more numbers than the kind that can be written down using only the digits zero through nine, as we'll see later. And if infinity can be said to be a number at all, it probably a number with a conventional representation.

Finally, the abstract nature of infinity can also be difficult to connect to everyday experiences. There are a multitude of reasons why this might be so, but one candidate hypothesis is that our evolution has not required us to regularly confront infinities in order to survive. The things we interact with are typically very finite -- scarce, small in quantity, usually able to be touched and held and seen. So it is perhaps not surprising that humans don't deal with the notion of infinity well.

Yet, while problematic, these issues aren't wholly intractable. It's not only _possible_ to talk about infinity, it's a _necessity_ for some parts of mathematics. But where can we begin?

# Infinity means a lot of things

One place to start the discussion is to think about some flavors of infinity. Let's imagine the following quantities:

* the number of digits after the decimal point in $$ .123123123\cdots $$
* the value of $$ \sqrt{2+\sqrt{2+\sqrt{2+\cdots\strut}}} $$
* the length of the sequence $$ 0, 1, 2, 3, \cdots $$

# Almost infinities

These are all, at a cursory glance, things that might seem to be infinite. But a closer look will reveal distinctions between them.

## "Infinitely" repeating digits: $$ .\overline{123} $$

There certainly appears to be something infinite about a string of digits that [repeats forever](http://en.wikipedia.org/wiki/Repeating_decimal). But notice that the number $$ .\overline{123} $$ is equal to $$ \frac{123}{999} $$, which in turn can be reduced to $$ \frac{123}{999} = \frac{41}{333} $$.

So this apparent infinity is really just a quirk of how we represented the number, and not anything intrinsic to the number itself. For example, in base 10, $$ \frac{1}{3} $$ is the repeating decimal $$ .\overline{3}_{10} $$. But in base 12 it becomes $$ (\frac{1}{3})_{10} = 0.4_{12} $$.

The fact that we can write a number down at all and pinpoint it precisely on the number line means that we know its exact value, so this doesn't seem like a very interesting kind of infinity.

## "Infinitely" nested structures: \\( \sqrt{2+\sqrt{2+\sqrt{2+\cdots}}} \\)

What about \\( \sqrt{2+\sqrt{2+\sqrt{2+\cdots\strut}}} \\)? An infinitely recursing expression sure sounds like it's infinite. This cannot be waved away as a trick of representation, as we could with the previous example. There is a structure which must be untangled.

Can this expression have a defined value? Let's suppose for a moment that it can, and we'll call this value $$ S $$. Then

$$
  S = \sqrt{2+\sqrt{2+\sqrt{2+\cdots\strut}}}
$$

When we square both sides, we get:

$$
  S^2 = 2 + \sqrt{2+\sqrt{2+\cdots\strut}}
$$

But notice that this includes $$ S $$ too:

$$\begin{eqnarray}
  S^2 & = & 2 + \underbrace{\sqrt{2+\sqrt{2+\cdots\strut}}}_{S} \\
  S^2 & = & 2 + S                                               \\
  S^2 - S - 2 & = & 0
\end{eqnarray}$$

This is a [quadratic equation](http://en.wikipedia.org/wiki/Quadratic_equation) with respect to $$S$$ and can be factored:

$$ 0 = (S + 1)(S - 2) $$

yielding the roots $$ S = \{2, -1\} $$; if we assume that square roots can only be positive, then $$ S = 2 $$, so

$$
  2 = \sqrt{2+\sqrt{2+\sqrt{2+\cdots\strut}}}
$$

Again, our attempt at infinity has yielded a very finite number. It's clear that merely repeating something indefinitely or recursing indefinitely doesn't necessarily mean we'll get something that looks like infinity.

## "Infinitely" long sequences: the length of $$ 0, 1, 2, 3, \cdots $$

Our third example, the length of $$ 0, 1, 2, 3, \cdots $$, looks more promising. Unlike our repeating-decimal example, there doesn't seem to be an obvious way we can simply change the problem's representation to wind up with something finite. This sequence of natural numbers increases slowly but surely, upwards forever without bound.

<aside>The natural numbers have their name because they are what we would use to count things, which is perhaps the most "natural" use for numbers. Conveniently, each number describes both its position in the natural numbers and the count of the things it would label.</aside>

Is this infinity, at last? And if so, is it just the integer that goes at the end of the natural number line, as shown below?

![diagram showing the integers with infinity as a point on the line]({{ page.image_path }}/chart-entry-infinity-number-line.png)

A little thinking will show this idea can't work. Suppose we assume that $$\infty$$ can be defined as "the largest natural number" and we can place it on the number line somewhere.

1. We know that we can always add one to a natural number $$n$$ to get the next natural number -- its successor, $$\mathcal{S}(n)$$. For example, $$\mathcal{S}(496) = 496 + 1 = 497$$.
2. Since $$\infty$$ is a natural number, we can take its successor $$\mathcal{S}(\infty) = \infty + 1$$.
3. That would create a new number $$\infty' = \infty + 1$$, so $$\infty' > \infty$$. But we just said $$\infty$$ was the largest natural number!
4. That's a contradiction. So our assumption was false -- an object representing "the point on the number line representing the largest natural number" is, in some sense, incompatible with the idea of a number line which can be extended indefinitely.

By the same token, we can see that infinity can't be the largest integer, the largest rational number, the largest real number, and so on.

So the definition of infinity as "the largest natural number" doesn't work very well. $$\infty$$ here seems more like it's not on the number line at all. It's just an extreme, unattainable limit:

![diagram showing the integers with infinity as an extremum]({{ page.image_path }}/chart-entry-infinity-number-line-infinity-end.png)

# Infinity and numbers: properties

Our earlier attempts at trying to wrangle infinity into a conventional number failed; infinity is too different from those numbers to be represented this way. But there's another way to think about the infinite: we can talk about the _properties_ we want to describe.

One property of infinity that seems worth capturing is the idea of _size_: infinity seems like it should be indefinitely large, larger than anything else. Another is the idea of _ordering_: infinity seems like it should come last, after everything else.

<aside>Ordinal and cardinal numbers are relevant for finite quantities too, but in that case, their ideas coincide, which isn't very interesting. That is, the ordinal number "5" describes a set with five things that has a particular order, and the cardinal number "5" represents a set with five things. Over natural numbers, they would describe the same set: \(\{0, 1, 2, 3, 4\}\).</aside>

We can represent these two properties by using two special kinds of numbers: _cardinal_ and _ordinal_ numbers.

## Cardinal numbers

Imagine we have a _set_, a mathematical collection of unique elements. One property of sets we're often interested in measuring is their _size_, or _cardinality_. So we'd like to ask the question, "how many objects are there in this set?". The answer to that question is always a _cardinal number_.

The cardinality $$\vert S \vert$$ of a finite set $$S$$ is the number of items in the set. For instance, if $$S = \{\mathtt{blue, sunshine, puppy}\}$$ then its cardinality $$\vert S \vert = 3$$. Likewise the cardinality of the empty set $$\vert \{\} \vert = 0$$.

When we count things, we're labeling each item with a specific name from the set of cardinal numbers: "one", "two", "three", and so on. This matches an item in the set we're counting with the name of a cardinal number. The cardinal number we stop at after matching all the items is the size of the set.

When we ask for the cardinality of an infinite set, like the natural numbers $$\mathbb{N}$$, the same rules apply: we get the cardinality by matching all the items in the size of the set. The answer is also a cardinal number.

## Cardinality of infinite sets

What happens when we ask about the cardinality of an infinite set -- say, the natural numbers $$\mathbb{N}$$? Since this set has an infinite number of elements, the cardinality we want to assign to it can't be a natural number. (If it were, then we'd just wind up back in the number-line problem we saw before.) Instead, it has to be a different, special kind of number.

The special numbers that mathematicians use to refer to the cardinalities of infinite sets are called the _aleph numbers_, and they belong to the set $$\aleph = \{\aleph_{0}, \aleph_{1}, \aleph_{2}, \cdots\}$$. The first and smallest member of this set is $$\aleph_{0} = \vert\mathbb{N}\vert$$: this is, in effect, the smallest kind of infinity.

The way to determine cardinality of a set relative to another is to match the two sets up against each other. If we are able to pair each element of one set with another, with no unpaired elements, then we know that the sets have the same cardinality. This kind of pairing relationship is called a _bijection_. For example, if $$S = \{\mathtt{blue, sunshine, puppy}\}$$ and $$T = \{\mathtt{apple, orange, banana}\}$$, then we can show $$\vert S \vert = \vert T \vert$$ by noticing that

$$
  S \times T = \{(\mathtt{blue}, \mathtt{apple}), (\mathtt{sunshine}, \mathtt{orange}), (\mathtt{banana}, \mathtt{puppy})\}
$$

A counterintuitive result of this is that infinite sets which seem completely different in size can have the same cardinality, because we can often find a bijection between them. For example, the even natural numbers $$\{0, 2, 4, 6, \cdots\}$$ have the same cardinality as all natural numbers $$\{0, 1, 2, 3, \cdots\}$$.

At first, this may be impossible to believe: how can a set with some of its elements missing be the same size as the original set? Such are the consequences of being infinite: things no longer behave the way you might expect! Objects certainly don't behave this way in the real world.

To see why it's true that the even natural numbers $$2\mathbb{N}$$ have the same cardinality as the natural numbers $$\mathbb{N}$$, imagine that our mapping $$\mathbb{N} \overset{f}{\mapsto} \mathbb{N}$$ is the function $$f(n) = 2n$$. Now we've defined a relationship between every natural number and every even number:

![diagram showing a mapping of natural numbers to even natural numbers]({{ page.image_path }}/chart-entry-set-cardinality.png)

If we can define a bijection between any two sets, like we do here, we know they must be the same cardinality.
{:.caption}

Since we were able to pair each element of one set with the other with no left-over elements, the sets must have the same cardinality. And since $$\vert \mathbb{N} \vert = \aleph_{0}$$, then it must be true that $$\vert 2\mathbb{N} \vert = \aleph_{0}$$.

A similar approach applies for almost any other infinite subset of the natural numbers you can name. In general we can just set $$f(n)$$ to be "the $$n$$<sup>th</sup> element of the other set", and we can get a bijection.

## Ordinal numbers

<aside markdown="1">
Sometimes mathematicians drop the hyphen and write _wellordering_ or _wellorder_, making it one word. We'll keep it here for clarity.
</aside>

Whereas cardinality and cardinal numbers describe the _size_ of sets, we can also talk about the _order_ of sets, too. Ordinal numbers describe a particular kind of ordering of the elements in sets, called a _well-ordering_.

For an ordering to be a well-ordering, it must have two properties:

* **Orderable:** For any two elements $$a, b \in S; a \neq b$$, exactly one of the following is true: $$a < b$$ or $$b < a$$.
* **Least element:** There is a least element in $$S$$.

Just because a set satisfies the first property doesn't mean it will satisfy the second. For example, there is no smallest real number in $$\mathbb{R}$$, so the real numbers are orderable, but not well-ordered. Nevertheless, well-orderings are a very useful way to think about many kinds of sets.

## Building the ordinals

Conveniently, if you order the natural numbers, you get a well-ordering. Mathematicians usually like to start from simple building blocks to construct more interesting ideas, so this seems like a good place to start building the ordinals. The most common way to construct the ordinals is to build them one at a time, starting from zero.

Each element in the sequence of ordinals corresponds to an _order type_: a description of how the items in the set are ordered. The first ordinal is zero, the order type of the empty set:

$$
  0_{\mathtt{ord}} \equiv \emptyset
$$

The second ordinal is constructed by taking the previous ordinal and adding it to a set that contains that ordinal. In this case, that means taking the union of the ordinal $$0_{\mathtt{ord}}$$ and a set containing it, or $$\{0_{\mathtt{ord}}\}$$. And since $$0_{\mathtt{ord}} = \emptyset$$, the empty set, that means we have $$\emptyset \cup \{\emptyset\}$$, so we wind up with just $$\{\emptyset\}$$:

$$
  1_{\mathtt{ord}} \equiv 0_{\mathtt{ord}} \cup \{0_{\mathtt{ord}}\} = \{0_{\mathtt{ord}}\} = \{\emptyset\}
$$

All the subsequent finite ordinals are constructed in a similar way:

$$\begin{eqnarray}
  2_{\mathtt{ord}} & \equiv & 1_{\mathtt{ord}} \cup \{1_{\mathtt{ord}}\} = \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}\} & = & \{\emptyset, \{\emptyset\}\} \\
  3_{\mathtt{ord}} & \equiv & 2_{\mathtt{ord}} \cup \{2_{\mathtt{ord}}\} = \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}\} & = & \{\emptyset, \{\emptyset\}, \{\{\emptyset\}\}\} \\
  4_{\mathtt{ord}} & \equiv & 3_{\mathtt{ord}} \cup \{3_{\mathtt{ord}}\} = \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, 3_{\mathtt{ord}}\} & = & \cdots \\
  5_{\mathtt{ord}} & \equiv & 4_{\mathtt{ord}} \cup \{4_{\mathtt{ord}}\} = \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, 3_{\mathtt{ord}}, 4_{\mathtt{ord}}\} & = & \cdots \\
\end{eqnarray}$$

<aside markdown="1">
  By convention, we generally don't write the `ord` subscript, so ordinals look like natural numbers without more context.
</aside>

Just as cardinal numbers are the possible answers to the question, "How many elements are in this set?", the ordinal numbers are the possible answers to "What is the order type of this set?" The order type describes the arrangement of the items in the set as a sequence. An order type of 3, for example, means that we expect to see 3 elements in the set:

  * the smallest element
  * the second smallest element
  * the largest element
  
We could label those three elements as a sequence $$(0, 1, 2)$$. The cardinality of the set for this sequence would be $$\vert S \vert = 3$$, so the order type is the same as the set's size. In other words, the ordinality and cardinality of finite sets are always the same. That's not very interesting. It's only when we consider infinite sets that they become useful.

## Ordering the ordinals

We're beginning to get the tools we need to wrangle the infinities into our grasp. With one more piece we'll have everything we need: understanding the infinite ordinals.

We can order the ordinals by saying that $$i_{\mathtt{ord}} < j_{\mathtt{ord}}$$ if and only if $$i_{\mathtt{ord}} \in j_{\mathtt{ord}}\$$. Remember, before we saw that ordinals are actually sets comprising all the previous ordinals; for instance, $$3_{\mathtt{ord}} = \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}\}$$. So our ordering is obtained by looking to see whether an ordinal is already contained in another ordinal; if it is, then it's a lesser ordinal.

<aside markdown="1">
Remember, well-orderings only need a _least_ element, not a greatest one.
</aside>

The first _infinite ordinal_ is what we get when we consider the set of all finite ordinals. This is the order type of a sequence which is well-ordered but doesn't have a final element:

$$
  (0, 1, 2, \cdots)
$$

<aside markdown="1">
$$\omega$$ is the Greek lowercase letter "omega", so we usually just say "omega" when we're reading it out loud. You may have already seen the uppercase version, $$\Omega$$.
</aside>

We call this ordinal $$\omega$$. The next ordinal is, perhaps not surprisingly, $$\omega + 1$$, and we define it just like we did all the previous ordinals:

$$
  \omega + 1 \equiv \omega \cup \{\omega\} = \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega\}
$$

This corresponds to an ordering that looks like $$(0, 1, 2, \cdots, \omega)$$, where an infinite number of elements are in the $$\cdots$$. Notice that because $$\cdots$$ is _infinitely long_, there is no one ordinal that comes just before $$\omega$$. But _every_ finite ordinal $$k_{\mathtt{ord}}$$ comes before $$\omega$$, no matter what finite value you pick for $$k$$!

In effect, $$\omega$$ comes at the end of an infinite sequence of elements which lead up to it, which then ends that sequence. As a result, we call it a _limit ordinal_. The subsequent limit ordinals can be likewise defined:

$$
\begin{eqnarray}
  \omega + 1 & \equiv & \omega \cup \{\omega\} & = & \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega\} \\
  \omega + 2 & \equiv & (\omega + 1) \cup \{\omega + 1\} & = & \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega, \omega + 1\} \\
  \omega + 3 & \equiv & (\omega + 2) \cup \{\omega + 2\} & = & \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega, \omega + 2\} \\
\end{eqnarray}
$$

If we extend this infinitely, we can get another limit ordinal: $$2\omega$$. This is all the ordinals up to $$\omega$$, and then $$\omega$$ more limit ordinals!

$$
  2\omega \equiv \omega + \omega = \{\underbrace{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots}_{\omega \text{ finite ordinals}}, \underbrace{\omega, \omega + 1, \omega + 2, \cdots}_{\omega \text{ limit ordinals}}\}
$$

Then we can likewise define $$2\omega + 1$$, then $$2\omega + 2$$, and so on:

$$
\begin{eqnarray}
  2\omega + 1 & \equiv & \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega, \omega + 1, \omega + 2, \cdots, 2\omega\} \\
  2\omega + 2 & \equiv & \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega, \omega + 1, \omega + 2, \cdots, 2\omega, 2\omega + 1\} \\
  2\omega + 3 & \equiv & \{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots, \omega, \omega + 1, \omega + 2, \cdots, 2\omega, 2\omega + 1, 2\omega + 2\} \\
\end{eqnarray}
$$

This again continues until we get $$3\omega$$, then again for $$4\omega$$, and so on:

$$
\begin{eqnarray}
  3\omega \equiv 2\omega + \omega & = & \{\underbrace{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots}_{2\omega \text{ ordinals}}, \underbrace{2\omega, 2\omega + 1, 2\omega + 2, \cdots}_{\omega \text{ ordinals}}\} \\
  \\
  4\omega \equiv 3\omega + \omega & = & \{\underbrace{0_{\mathtt{ord}}, 1_{\mathtt{ord}}, 2_{\mathtt{ord}}, \cdots}_{3\omega \text{ ordinals}}, \underbrace{3\omega, 3\omega + 1, 3\omega + 2, \cdots}_{\omega \text{ ordinals}}\}
\end{eqnarray}
$$

If we keep going, we can also define another limit ordinal, $$\omega^2$$:

$$
  \omega^2 = \omega \cdot \omega = \underbrace{\omega + \omega + \cdots}_{\omega \text{ additions}}
$$

This is starting to get a little dizzying, but we can continue this even further with $$\omega^\omega$$:

$$
  \omega^\omega = \underbrace{\omega \cdot \omega \cdot \omega \cdots}_{\omega \text{ products}}
$$

The chain continues indefinitely, forever and ever, on without end. Each successive limit ordinal describes a new structure -- a new way of ordering all the elements in the set you're considering.

And here's the most important part: the cardinality of all the limit ordinals, from $$\omega$$ to $$\omega^\omega$$ and beyond, is exactly the same as the cardinality of the natural numbers, $$\aleph_0$$. Given an infinite number of elements, there are an infinite number of ways to structure and order them!

# A infinite zoo of infinities

The choice of infinite structure we make -- the choice of what to consider important when arranging elements, and what rules we choose to follow and break -- is the source of a lot of counterintuitive ideas about infinity. Our notion of "size", as represented in cardinality, is _only one notion_ out of the _infinite_ possible ways to define it. And cardinality ignores many properties of structure that we consider important in our everyday experiences.

![the cardinality of the line and the plane are the same]({{ page.image_path }}/chart-entry-cardinality-line-plane.png)

The cardinality of any line and any plane are the same, since we can construct a bijection between any point on the line and any point on the plane.
{:.caption}

For example, the number of points on a line is the same as the number of points on a plane. This an idea that seems impossible at first: the plane has more dimensions than the line. Not only does the line fit into the plane, it does so infinitely many times. But this is exactly the kind of structure that doesn't need to be preserved in comparing cardinalities. The bijection between a line and a point cares only about whether the mapping is possible at all, and not whether it comports with our notions of how reality works. And the bijection does, in fact, exist; see [space-filling curves](http://en.wikipedia.org/wiki/Space-filling_curve).

So there isn't just "an infinity", $$\infty$$; this is a very restricted view of what infinity can be. Infinity is $$\omega$$, and $$\aleph_0$$, and their infinite continuations -- each with their own special properties, each containing an infinity unto themselves. For each and every way we can imagine that there might be an endless sequence of something, there is an infinity associated with that idea.

Infinity is really, really, really, $$\cdots$$, really big.

# Further reading and references

For more information, you can read up on [infinite sets](http://mathworld.wolfram.com/InfiniteSet.html), [transfinite numbers](http://en.wikipedia.org/wiki/Transfinite_number), the [continuum hypothesis](http://en.wikipedia.org/wiki/Continuum_hypothesis), and [Georg Cantor's work on set theory](http://en.wikipedia.org/wiki/Georg_Cantor#Set_theory). The explanation of the construction of limit ordinals is borrowed heavily from Niel de Beaudrap's very excellent [explanation](http://philosophy.stackexchange.com/a/6355) in Philosophy StackExchange and is worth a thorough read.