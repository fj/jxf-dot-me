---
layout: static-page
title:  Colophon
---

## Site

This website was made with love by [**John Feminella**](https://twitter.com/jxxf). Extensive and thoughtful work was also contributed by the redoubtable [**John Otander**](https://twitter.com/4lpine). Each bit was artisanally regurgitated onto the screen for your express delight.

## Tools

The site comprises an entirely static build pipeline. Individual files are written in a combination of [Markdown](http://daringfireball.net/projects/markdown/syntax) (created by John Gruber), with occasional inline [$$ \LaTeX $$](http://google.com) (created by [Leslie Lamport](http://en.wikipedia.org/wiki/Leslie_Lamport)). Templates are in HTML using the [Liquid templating language](http://liquidmarkup.org/).

The final content is then rendered into HTML via [Jekyll](jekyllrb.com/) in a [Rake](https://github.com/ruby/rake) pipeline. The $$ \LaTeX $$ is rendered by [MathJax](http://www.mathjax.org/), using [JavaScript](http://www.ecma-international.org/publications/standards/Ecma-262.htm). No dynamic content is served or stored, so HTTP-level caching with [Varnish](https://www.varnish-cache.org/) is very easy since files don't change much.

## Type

The fonts are [PT Sans](http://www.google.com/fonts/specimen/PT+Sans) from [ParaType](http://www.paratype.com/public/), and [Slabo 27px](http://www.google.com/fonts/specimen/Slabo+27px) from John Hudson at [Tiro Typeworks](https://github.com/TiroTypeworks/Slabo).

## Contact <a name="contact"></a>

Need to talk to the author? This is the quickest way to reach me.

{% include contact.html %}