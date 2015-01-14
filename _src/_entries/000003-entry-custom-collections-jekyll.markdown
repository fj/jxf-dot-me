---
type:         snippet
title:        "Fully-Featured Custom Collections in Jekyll"
date:         2015-03-19T07:00:00Z
tags:
  - jekyll
description: >
  Making custom collections with Jekyll.
---

[Jekyll](https://github.com/jekyll/jekyll) is a popular static site generator written in Ruby and in wide use. A major selling point for Jekyll adoption is that it provides some excellent defaults out of the box, heavily geared towards the assumption that you're writing a blog. It does this largely by taking a convention-over-configuration approach; the defaults are designed to be sensible choices for the majority of its users. However, like many convention-over-configuration systems, it can be tough to make it behave the way you want as soon as you step outside of the prescribed boundaries.

![Jekyll logo](http://jekyllrb.com/img/logo-2x.png)

Because it's so easy to get started with Jekyll, it feels frustrating when you're eventually hamstrung by framework limitations. Unfortunately, while knee-deep in writing this site, I found myself in exactly that situation.

## Jekyll's default collections

Jekyll ships with two types of collections by default:

* _Posts_ are static files that live in your `_posts` directory by default and have the form `<YYYY>-<MM>-<DD>-<title>.<extension>`. Jekyll steers people towards the use of posts in blog environments thanks to comfortable defaults, and for that reason, most people write up their blog's entries as posts since it's the best fit. In your Liquid templates, the list of posts is available via `site.posts`, which is sorted in reverse chronological order.

* _Pages_ are static input files that get processed and mapped to correspondingly named output files. For example, if you have `contact.markdown` as an input file, it'll get mapped to `contact.html` in the output folder. In your Liquid templates, you can get the list of pages by iterating over the `site.pages` collection.

What do you do if the thing you want to add is neither a page nor a post? You can add _custom collections_ -- Jekyll's term for a set of things of the same kind, like "blog entries", "soccer matches", or "team members". While Jekyll's documentation is usually very good, it doesn't cover how to do this in a manner that retained most of the features of the default collections without having to rewrite it myself. 

You make a custom collection with two steps:

* First, you put a folder at your project's `source` root named after the collection. For example,  If the files in the collection should generate corresponding output files, then 

## Limitations of default collections

Pages and posts suffice for most use cases, but they have some big limitations that may not readily be apparent.

### Inflexible post filename formats

First, every post file must be named according to the format string `<YYYY>-<MM>-<DD>-<title>.<extension>`. Any post which doesn't have this form is invalid and throws an error.

I found this to be an obnoxious limitation because I don't usually finish a post on the same day I start it. That means that the filename I make the post with reflects the day I started the post, not the day I finished the post. You can override the date that Jekyll actually outputs by using `date` in your [YAML front matter](jekyllrb.com/docs/frontmatter/), but then there's no point in also having a date in the filename, since it's redundant and never used.

### Inconsistent domain model of posts and pages

Pages don't have access to most of the Liquid attributes that posts do. This means that your templates must special-case pages and posts to a degree that requires a lot of repetition. In my layouts, a post is merely a page that has some extra metadata shown, so I wanted to avoid special-casing things if I could.

The crux of the issue can be found in the Jekyll code for [posts](https://github.com/jekyll/jekyll/blob/0d1586a5c471d322a79177e3e9c2f5813c697c32/lib/jekyll/post.rb#L9-L28) and [pages](https://github.com/jekyll/jekyll/blob/0d1586a5c471d322a79177e3e9c2f5813c697c32/lib/jekyll/page.rb#L10-L17). Posts get fourteen attributes to work with:

~~~ruby
ATTRIBUTES_FOR_LIQUID = %w[
  title url dir date id
  categories tags
  next previous
  path

  content
  excerpt
  excerpt_separator
  draft?
]
~~~

But pages only get a small subset of these, plus a confusing `name` attribute that is distinct from the `title` found on posts.

~~~ruby
ATTRIBUTES_FOR_LIQUID = %w[
  content
  dir
  name
  path
  url
]
~~~

There is an open issue for [Jekyll 3](https://github.com/jekyll/jekyll/issues/3169) discussing the 

### Bad sorting defaults

While most of Jekyll's defaults are sensible, the sorting defaults are undesirable. The sort key on a given post is the date of the post, which is either generated from the filename or from the `date` attribute. Jekyll sorts posts in ascending date order, so in a list of posts, a post dated January 15 comes after, e.g., one dated January 2, even though January 2 is lexicographically later.

But for pages, the sort key is the filename, so `january-2.html` is sorted after `january-15.html`, which is the reverse of how the posts behave. So if you want to get away from the special-casing of posts and have everything be a page, you'd have to accept some behavior changes.

That seems like a reasonable tradeoff. But then Jekyll recommends using the [`sort`](http://jekyllrb.com/docs/templates/) filter in your Liquid templates. So if you want pages to be sorted by, say, their `foo` property, you can do:

{%raw%}
~~~liquid
{% for p in site.pages | sort: 'foo' %}
~~~
{%endraw%}

But this requires you to make sure you have a `foo` property in your YAML front matter for each page, which can be obnoxious. If you forget, there won't be any hints or warnings, so your site will just silently break.

### No relative navigation available on custom collections

Anything that's not in the `_posts` collection doesn't get `next` or `previous` attributes to it, as we saw before. That in turn means