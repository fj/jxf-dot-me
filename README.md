# jxf-dot-me

> "The time has come", the Walrus said,
>   "To talk of many things.
> Of ships, and shoes, and sealing-wax;
>   Of cabbages and kings."
>
> -- _Louis Carroll_

Personal blog and portfolio site.

## Installation

This is a [Jekyll](http://jekyllrb.com) project which uses [Rake](https://github.com/ruby/rake)
for tasks regarding static assets. Static assets are uploaded to S3.

## Environment

An environment file (`.env`) is expected to exist. If it doesn't, an error will be raised when you try to deploy.

The environment file is expected to contain:

  * `SITE_S3_ASSET_BUCKET`: the bucket to use for reading/writing site assets
  * `AWS_ACCESS_KEY_ID`: the S3 key ID to use for AWS assets
  * `AWS_SECRET_ACCESS_KEY`: the S3 key to use for AWS assets

## Todo

- [ ] Add sidenotes (SNs)
- [ ] Add margin notes (MNs)
- [ ] Add full width content
- [ ] Convert existing RHS content to MNs / SNs
- [ ] Convert existing wide tables to full-width content
- [ ] Remove "main content is X% wide" CSS hacks in `_aside.scss` after MNs/SNs transition
- [ ] Use YYYY-MM-DD dates in shortlists on homepage; adjust spacing as needed
- [ ] Remove dangling left metadata column from lists and individual entries; move metadata below title
- [ ] Full event list should use portfolio-page-like template instead of blog-list-like template
