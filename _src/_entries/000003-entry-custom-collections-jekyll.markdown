---
type:         snippet
title:        "Fully-Featured Custom Collections in Jekyll"
date:         2015-04-10T07:00:00Z
tags:
  - jekyll
description: >
  Making custom collections with Jekyll.
---

[Jekyll](https://github.com/jekyll/jekyll) is a popular static site generator written in Ruby and in wide use. A major selling point for Jekyll adoption is that it provides some excellent defaults out of the box, heavily geared towards the assumption that you're writing a blog. It does this largely by taking a convention-over-configuration approach; the defaults are designed to be sensible choices for the majority of its users. However, like many convention-over-configuration systems, it can be tough to make it behave the way you want as soon as you step outside of the prescribed boundaries.

![Jekyll logo](http://jekyllrb.com/img/logo-2x.png)

Because it's so easy to get started with Jekyll, it feels frustrating when you're eventually hamstrung by framework limitations. Unfortunately, while knee-deep in writing this site, I found myself in exactly that situation with respect to Jekyll's collections. I wanted to make my own custom collections, but very few of the features available to the default collections are available to the custom collections.

# Jekyll's default collections

Jekyll ships with two types of collections by default:

* _Posts_ are static files that live in your `_posts` directory by default and have the form `<YYYY>-<MM>-<DD>-<title>.<extension>`. Jekyll steers people towards the use of posts in blog environments thanks to comfortable defaults, and for that reason, most people write up their blog's entries as posts since it's the best fit. In your Liquid templates, the list of posts is available via `site.posts`, which is sorted in reverse chronological order.

* _Pages_ are static input files that get processed and mapped to correspondingly named output files. For example, if you have `contact.markdown` as an input file, it'll get mapped to `contact.html` in the output folder. In your Liquid templates, you can get the list of pages by iterating over the `site.pages` collection.

# Limitations of default collections

Pages and posts suffice for most use cases. However, these have some limitations.

## Inflexible post filename formats

First, every post file must be named according to the format string `<YYYY>-<MM>-<DD>-<title>.<extension>`. Any post which doesn't have this form is invalid and throws an error.

I found this to be an obnoxious limitation because I don't usually finish a post on the same day I start it. That means that the filename I make the post with reflects the day I started the post, not the day I finished the post. You can override the date that Jekyll actually outputs by using `date` in your [YAML front matter](jekyllrb.com/docs/frontmatter/), but then there's no point in also having a date in the filename, since it's redundant and never used.

## Inconsistent domain model of posts and pages

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

There is an open issue for [Jekyll 3](https://github.com/jekyll/jekyll/issues/3169) discussing the possibility of unifying collections of different kinds, but it's not yet resolved, so the status quo is still a vast gulf of difference.

## Inconvenient sorting defaults

While most of Jekyll's defaults are sensible, the sorting defaults can be undesirable. The sort key on a given post is the date of the post, which is either generated from the filename or from the `date` attribute. Jekyll sorts posts in ascending date order, so in a list of posts, a post dated January 15 comes after, e.g., one dated January 2, even though January 2 is lexicographically later.

But for pages, the sort key is the filename, so `january-2.html` is sorted after `january-15.html`, which is the reverse of how posts behave. So if you want to get away from the special-casing of posts and have everything be a page, you'd have to accept some behavior changes.

The way this behavior is implemented isn't very convenient, however. Jekyll recommends using the [`sort` filter](http://jekyllrb.com/docs/templates/) in your Liquid templates. If you want pages to be sorted by, say, their `foo` property, you can do:

{%raw%}
~~~liquid
{% for p in site.pages | sort: 'foo' %}
~~~
{%endraw%}

This requires you to make sure you have a `foo` property in your YAML front matter for each page, which can be tedious. If you forget to add this for even a single post, there won't be any hints or warnings -- your site's ordering will just silently break.

## No relative navigation available

Anything that's not in the `_posts` collection doesn't get `next` or `previous` attributes to it, as we saw before. That means there's no way to get an ordering over the items in your collection, which is obnoxious if your collection has a natural ordering over some field. For example, you almost always want blog posts to be ordered by their `date` field, but you won't get this ability on your pages.

# Custom collections to the rescue

What do you do if the thing you want to add is neither a page nor a post? You can add _custom collections_ -- Jekyll's term for a set of things of the same kind, like "blog entries", "soccer matches", or "team members". While Jekyll's documentation is usually very good, it doesn't cover how to do this in a manner that retained most of the features of the default collections without having to rewrite it myself. 

To make a custom collection, first _decide on a name_ for your collection. Then make a folder named `_<name>` in your source directory. For instance, if you want to make a collection representing the authors on your site, you might have an `authors` collection, so you would want a directory named `_authors`.

Second, _configure the collection_ in your project's `_config.yml` under a hash named `collections`. Each key in this hash is the name of a collection you'll use in Jekyll. For example, a minimal `authors` collection would look like this in your `_config.yml`:

```yaml
collections:
  authors
```

If you have other collections, you can add them here too, one collection per key.

```yaml
collections:
  authors:
  entries:
  recipes:
```

If the files in a collection should generate corresponding output files, then add `output: true` to each custom collection for which that's true. For example, if you want to generate a page for each author, your collection can be:

```yaml
collections:
  authors:
    output: true
```

At this point, you've got a custom collection, but it's not very useful -- it has none of the nice default behavior from `posts` that we mentioned before, and it lacks even basic things like being able to sort your collection by date.

# Making custom collections useful

To fix this, I wrote the [SpicyJekyll plugin](https://github.com/fj/spicy-jekyll): this augments your custom collection with five useful behaviors to make them behave more like you might expect:

1. Orders your collections by `date` (or a custom sort key of your own choosing).
2. Adds `next` and `previous` references to your collection's documents so you can use them in lists or archives.
3. Checks for a `title` property on each document.
4. Adds stable, filename-based permalinks that won't change if you change the title.
5. Logs what it's doing to diagnose collection problems if there are any issues.

To use it, just drop it into your plugins directory. Give it a spin on your own custom collections!