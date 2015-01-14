---
type:         post
title:        "Asking Great Questions"
date:         2015-03-16T08:00:00Z
tags:
  - mentorship
description: >
  How to ask great technical questions.
---

> Computers are useless. They can only give you answers.
> 
> -- Pablo Picasso <sup>[src](http://quoteinvestigator.com/2011/11/05/computers-useless/)</sup>

As an occasional technical mentor, one of the many vicarious privileges I get is watching knowledge crystallizing in someone else. There's often a distinct moment where difficult topics make sense, where hours or days of practice come to fruition. Suddenly, it all clicks.

Getting to this point is intensely satisfying for both mentor and mentee, but it's also very hard to do without the right cognitive toolset. Deep understanding requires both the discipline of a receptive mind and the willpower to make it happen.

One of the best ways to practice and develop that cognitive toolset is to ask great questions. This is harder than it sounds. While we all have a natural aptitude for asking questions, the frequency of our question-asking tends to peak around age 4, [according to a NIH-funded study](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2784636/). But at age 4, we haven't developed the communication skills we have as an adult, so our questions tend to be simple cause-and-effect relationships.

How nice it would be if we could have our cake and eat it too. We'd like to be able to keep the earnest curiosity and inquisitiveness of our four-year-old self, using questions as a discovery tool, while also crafting them in such a way to lead us to the right answer.

What follows is some distilled advice on how to do just that. As of this writing, I've answered about a little over [one thousand questions](http://stackoverflow.com/users/75170/john-feminella?tab=answers) on StackOverflow, so I think I've developed a sense of what makes for a good technical question and what doesn't.

## Flavors of questions

First, not all technical questions are alike. The _purpose_ of the question and the _intention_ of the asker are two important factors for deciding how to ask the question.

Generally, you'll encounter four different flavors:

* **Identification:** Bug reports, errors, or other behavior exhibited by software that the asker thinks shouldn't be happening. The asker knows what the desired behavior is, and wants help with identifying the nature of the issue, so that the unwanted behavior can be replaced with the desired behavior.

   * When I do X, Y happens, but I wanted Z. How do I get Z?
   * I want to X, but can't because of Y. How do I X?

* **Comprehension:** The asker has noticed a software behavior that they think belies a more general principle or idea they want to understand. They want to know _why_ something happens and develop a deeper intuition about that behavior.

   * When I add two floating-point numbers together, why don't I get an exact answer?
   * Why is shared mutable state bad?

* **Situational:** The asker has a narrow, focused issue that they're not sure how to resolve. They may want to understand the deeper cause, but more often than not they're stuck on something and looking only for a solution to their specific problem. Askers may have trouble being able to generalize from the specific situation to a more general description of their problem.

  * When I do X, Y, and Z in this code, why do I get the following exception?
  * How do I resolve "error E1234: bad path"?

* **Strategic:** The asker is thinking about broader questions that aren't necessarily about a specific problem at hand. They're wondering about the nuances, tradeoffs, and merits of several different approaches, and want to know if they've considered all the paths at hand.

  * What is the best way to accomplish X?
  * How do I share data between threads without causing a race condition?

Each of these deserves its own, special treatment.

## Good questions

A good question has three essential features.

* First, it is unambiguous and clear; there is no doubt what the asker means. If technical terms are used, the asker shows that they're using those terms correctly. If they're not used correctly, the asker probably needs to figure out why

* Second, it demonstrates commitment; the asker has put in some effort towards a solution, and isn't expecting an answer just to be handed off.

* Third, it 

## Great questions

Good questions are really the minimum for getting help. Without meeting this bar, a mentor needs to spend some time understanding what you already know in order to give you a good answer.

A great question goes farther and, often, elicits one of the most powerful compliments a technologist can pay to another technologist: "That's a great question!".

## Bad questions

Specifically, a good

Consider how a novice software developer might react to a problem they can't solve:

  * Write some code.
  * Encounter a problem that prevents them from proceeding.
  * Try to solve the problem.
  * Get stuck: Making further progress is difficult or impossible.
  * Ask for help.

The

## What to do before you ask a question

I mentored a

If help is too easy to get, some mentees may be incentivized not to put as much effort into being self-sufficient and solving their own problems. This is a vital skill in software development, because the odds are high that even beginners will face a problem that no one has solved before. You may not be able to Google your way out of a problem that's specific to your company's codebase, for instance. But if help is hard to get, mentees will get frustrated

Because we don't generally train novice software developers in the art of asking good questions It can be challenging

