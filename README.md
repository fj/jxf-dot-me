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

## New items

### Events

Events take the following metadata:

```yaml
event:
  date_range: 2015-10-22⋯30
  name: O'Reilly Markup Convention 2015
  topic: YAML Considered Harmful
  host: O'Reilly
  host_url: http://markupconvention.example.com
  location: XYZ Hotel
  location_poi_url: http://example.com/
  location_geo: Fakecity, NY, US
  location_geo_url: http://example.com/
```

## Todo

- [X] Add sidenotes (SNs)
- [X] Add margin notes (MNs)
- [X] Add full width content
- [X] Convert existing wide tables to full-width content
- [X] Remove "main content is X% wide" CSS hacks in `_aside.scss` after MNs/SNs transition
- [X] Use YYYY-MM-DD dates in shortlists on homepage; adjust spacing as needed
- [X] Remove dangling left metadata column from lists and individual entries; move metadata below title
- [ ] Convert existing RHS content to MNs / SNs
- [ ] Full event list should use portfolio-page-like template instead of blog-list-like template
- [ ] Extract duplicated work between event/project layouts
- [ ] Use `talk: ...` metadata blocks (in data files? directly in frontmatter?) to generate talk details on showcase-items
