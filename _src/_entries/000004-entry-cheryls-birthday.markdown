---
type:         post
title:        "Solving the \"Cheryl's Birthday\" Problem with Prolog"
date:         2015-04-17T08:00:00Z
published:    true
tags:
  - prolog
  - experiments
  - software
description: >
  Using the Cheryl's Birthday problem to explore Prolog.
---

The "Cheryl's Birthday" problem has attracted a lot of press, with [CNN](http://www.cnn.com/2015/04/15/living/feat-cheryl-birthday-math-problem-goes-viral/), the [Washington Post](http://www.washingtonpost.com/news/morning-mix/wp/2015/04/14/when-is-cheryls-birthday-the-math-problem-that-stumped-the-internet/), [Slate](http://www.slate.com/articles/video/video/2015/04/cheryl_s_birthday_answer_singapore_logic_math_problem_solved_video.html), and the [Telegraph](http://www.telegraph.co.uk/education/educationnews/11534378/When-is-Cheryls-birthday-The-tricky-math-problem-that-has-everyone-stumped.html) and [countless others](https://twitter.com/search?q=%23cherylsbirthday) weighing in.

There's plenty of explanations that give a good overview of the problem and show you how to work out the solution to the problem via a series of logical deductions. But what if we could just ask a computer to find the answer for us?

![chocolate cake with the text 'Happy Birthday, Cheryl' written in frosting]({{ page.image_asset_path }}/cheryl.jpg)

# The problem

To briefly recap, the problem statement is as follows:

> Albert and Bernard have just met Cheryl. "When is your birthday?" Albert asked Cheryl. Cheryl thought for a moment and said, "I won't tell you, but I'll give you some clues". She wrote down a list of ten dates:
>
> * May 15, May 16, May 19
> * June 17, June 18
> * July 14, July 16
> * August 14, August 15, August 17
>
> "One of these is my birthday," she said.
>
> Cheryl whispered in Albert's ear the month, and only the month, of her birthday. To Bernard, she whispered the day, and only the day. "Can you figure it out now?" she asked Albert.
>
> * **Albert:** "I don't know when your birthday is, but I know Bernard doesn't know, either."
> * **Bernard:** "I didn't know originally, but now I do."
> * **Albert:** "Well, now I know, too!"
>
> When is Cheryl’s birthday?

The heart of the problem are the statements exchanged by Albert and Bernard. Initially, neither Albert and Bernard know when Cheryl's birthday is, but through deduction they mutually arrive at a unique, correct answer.

This must mean that, somehow, the set of possibilities offered by Cheryl satisfies some set of properties that make it possible for Albert and Bernard to arrive at the answer. If we can write these properties down into a form that a computer can understand, we can have these deductions done for us. Wouldn't that be nice?

Enter [Prolog](http://en.wikipedia.org/wiki/Prolog)! It's pretty rare that I ever pick it up, but this seemed like a great excuse to try it out again. Let's see where we get!

# Prolog

Prolog {% margin %}If you want to install Prolog yourself and follow along, follow the directions <a href="http://www.swi-prolog.org/build/">here</a>. You can load Prolog programs with <code class="shell">prolog -e x.pl</code>.{% endmargin %}
belongs to a relatively rare breed of _logic programming languages_, in contrast to _imperative_ programming languages. Broadly, imperative languages require that your program take the form of a series of explicit instructions that describe what to do. For example, an imperative program to find the smallest element in a list might take a form like this:

```
smallest(list):
  * Declare `result`.
  * Set `result` to the first element of `list`.
  * For each element `e` in `list`:
    * Set `result` to be `e`, if `e` is smaller than `result`.
  * Answer: `result`.
```

With _logic_ languages, however, you describe a set of facts and ask whether there is a consistent conclusion that can be reached from those facts. The logic-programming version of the same program might be something like:

```
smallest(list):
  * Answer: the element `e` in `list` such that for all other
      elements `E`, `e` <= `E`.
```

This is an interesting inversion of responsibilities relative to imperative programs: instead of _telling a computer what to do_, we say _what the answer has to look like_. Then the computer is free to decide how to arrive at the answer.

All Prolog programs adopt this approach. We describe a series of true statements, then ask Prolog to evaluate a question to see if there is an answer that is consistent with everything we described. Those statements can take the form of either _facts_ or _rules_.
{% margin %}<code>;</code> is disjunction in Prolog, similar to the <code>or</code> keyword elsewhere; <code>,</code> is conjunction, like <code>and</code>.{% endmargin %}

* Facts are true statements in the universe of the program, like "grass is green", "Bob is a person", or "Alice is Bob's sister". In Prolog, we might express these as `green(grass)`, `person(bob)`, and `sibling(alice, bob)`, respectively.

* Rules tell you how to evaluate a set of circumstances to decide if they're true or not. For example, we might define a rule like `parent(X, Y) :- mother(X, Y); father(X, Y).`; this could be used to express the rule "X is Y's parent if (a) X is Y's mother, or (b) X is Y's father". Facts are like rules whose body is just the predicate `true`.

That's about it. Let's see if we can use Prolog to help us solve Cheryl's birthday.

# Getting to an answer

Doing anything useful in Prolog is about constructing the correct set of facts and rules to describe the universe you want to talk about. Our task is to represent the problem statements as facts or rules so that we can arrive at the correct answer.

## Cheryl's list of birthdays

First, Cheryl says that her birthday is one of the previously mentioned ten distinct possibilities. To represent this in Prolog, we'll just enumerate them as individual facts:

```prolog
candidate_birthday('May', 15).
candidate_birthday('May', 16).
candidate_birthday('May', 19).
/* ... */
candidate_birthday('August', 17).
```

If we wanted to cut down on the repetition, we can also write this as a _rule_ instead of a series of facts. The rule is that a month and a day are a candidate birthday if they belong to the set of candidate birthdays:

```prolog
candidate_birthday(Month, Day) :-
  member(Month/Day,
    [
      'May'/15, 'May'/16, 'May'/19,
      'June'/17, 'June'/18,
      'July'/14, 'July'/16,
      'August'/14, 'August'/15, 'August'/17
    ]
  ).
```

The rule form is nicer if we have a lot of birthdays to check, since we can just add an element to the list.

Next, we have the dialogue between Albert and Bernard:

> **Albert:** "I don't know when your birthday is, but I know Bernard doesn't know, either."
> **Bernard:** "I didn't know originally, but now I do."
> **Albert:** "Well, now I know, too!"

We'll need to transform each of these three statements into Prolog to find the answer.

## First statement: Albert's stumped, but knows Bernard is too

We're looking for a `<month, day>` combination that makes it possible for each of the three statements to be true, so we should use some rules to represent that. We'll start with Albert's first statement.

We know that the final answer must be one of the days Cheryl named, so let's start with that constraint:

```prolog
s1(Month, Day):-
  candidate_birthday(Month, Day),
  /* ... */
```

Next, we know that Albert knows the month but not the day of Cheryl's birthday, so he only has one half of the answer. However, even if Albert didn't know the day, he could know the answer if his month only had one possible day. But since every month has at least two possible choices for the day, he doesn't know the answer. So it must be the case that Albert's month has two or more choices for the day:

```prolog
s1(Month, Day):-
  candidate_birthday(Month, Day),
  findall(X, candidate_birthday(Month, X), [_, _ | _]),
  /* ... */
```

The `findall` predicate produces a list that satisfies all the constraints of the goal, the second parameter. In this case the predicate is true if the list of candidate birthdays has two or more elements. The `[...]` syntax denotes a list, while underscores mean "an arbitrary result", so `[_ , _]` means "a list with exactly two results".

Adding the list constructor `|` here means "the rest of the list", so `[_, _ | _]` means "a list with exactly two results, followed by zero or more results". So the overall effect is what we want: only candidate birthday months that have at least two elements.

This accounts for the first half of Albert's statement -- that he didn't know what Cheryl's birthday was, because there is not yet a unique answer. We also need to account for the second half of Albert's statement: Albert knows Bernard doesn't know the answer, either. The only way Albert could know that is if Bernard had a unique answer. And Bernard could only have a unique answer if his day uniquely determined his month.

There are two unique dates: the 19th only appears in May, and the 18th only appears in June. Albert therefore doesn't have May or June; if he did, Bernard could be holding either 18 or 19, and thus have a unique answer. But since Albert doesn't have May or June, he knows Bernard can't deduce the answer yet. So Albert knows that he holds a month which does not decide the day. We can write a rule that represents this idea:

```prolog
month_has_deciding_day(Month):-
    candidate_birthday(Month, Day),
    findall(M, candidate_birthday(M, Day), [_]).
```

and then we can invoke the negation of the rule to finish off Albert's first statement:

```prolog
s1(Month, Day):-
  candidate_birthday(Month, Day),
  findall(X, candidate_birthday(Month, X), [_, _ | _]),
  not(month_has_deciding_day(Month)).
```

This leaves us with five possible answers -- the dates in July and August. We can ask Prolog to verify this for us at the console:

```
$ prolog -e cheryl.pl

?- s1(Month, Day).
Month = 'July',
Day = 14 ;
Month = 'July',
Day = 16 ;
Month = 'August',
Day = 14 ;
Month = 'August',
Day = 15 ;
Month = 'August',
Day = 17.
```
{:.shell}

## Second statement: Bernard was stumped, but now he isn't

Bernard now says he knows the answer. He knows that Albert must hold a month which doesn't decide the day -- so he knows Albert is holding July or August. Since he knows the answer, it must be because every date uniquely decides a month at this point. Therefore, Bernard can't be holding 14, because that could be either July or August.

So our rule must therefore be able to determine the month at this point:

```prolog
s2(Month, Day):-
  candidate_birthday(Month, Day),
  findall(X, s1(X, Day), [Month]).
```

This rule returns true if the month and day of a given birthday are in the candidate list and if they uniquely determine the month after taking into account the first statement. Only three possible dates remain at this point: July 16, August 15, and August 17 -- the remaining dates which uniquely determine their month. We can verify this at the console:

```
$ prolog -e cheryl.pl

?- s2(Month, Day).
Month = 'July',
Day = 16 ;
Month = 'August',
Day = 15 ;
Month = 'August',
Day = 17.
```
{:.shell}

## Third statement: Albert's got it too

We're getting close! We just need to show that Albert can deduce the answer too. Since Albert holds the month, he could only know the answer for sure if his month uniquely determines the day:

```prolog
s3(Month, Day):-
  candidate_birthday(Month, Day),
  findall(X, s2(Month, X), [Day]).
```

This rule returns true if the month and day of a given birthday are in the candidate list, and if they uniquely determine the day after taking into account the second statement.

Albert can't be holding August, therefore, because that wouldn't uniquely determine the day -- it could be either August 15 or August 17. So he must be holding July, which in turn means that Cheryl's birthday must be July 16. And, indeed, that's what we get:

```
?- s3(Month, Day).
Month = 'July',
Day = 16 .
```
{:.shell}

Fantastic! Logic programming isn't suitable for everything, but it unquestionably shines at solving constraint-based problems like this one.

# Additional resources

You can see the GitHub repository for our script [here](https://github.com/fj/cheryls-birthday-prolog/) if you'd like to experiment with things yourself. It is borrowed almost completely from [Charles Perng](https://github.com/perng)'s [version](https://github.com/perng/prolog_collection/blob/master/cheryls_birthday.pl).

And finally, if you'd like to read more about Prolog, there are a lot of great resources around the web. The one that helped me the most was [Learn Prolog Now!](http://www.learnprolognow.org/) by [Patrick Blackburn](http://www.patrickblackburn.org/), [Johan Bos](http://www.let.rug.nl/bos/), and [Kristina Striegnitz](http://cs.union.edu/~striegnk/). You can also check out the very excellent IRC channel, which is `##prolog` on [Freenode](https://freenode.net/).

Happy hacking, friends.
