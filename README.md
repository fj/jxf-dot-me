# jxf-dot-me

> "The time has come", the Walrus said,  
>   "To talk of many things.  
> Of ships, and shoes, and sealing-wax;  
>   Of cabbages and kings."
>
> -- _Louis Carroll_

Personal blog and portfolio site.

## Installation

This is a [Jekyll](http://jekyllrb.com) project which uses [gulp](http://gulpjs.com)
for tasks regarding static assets.

### Dependencies

* [jekyll](http://jekyllrb.com)
* [bundler](http://bundler.io/)
* [node](http://nodejs.org) and npm
* [gulp](http://gulpjs.com)

### Build tasks

Install gulp globally:

```
npm i -g gulp
```

Run the npm install to pull down the required gulp packages:

```
npm i
```

Run the gulp tasks:

```
gulp
```

This will compile, prefix, and minify the SCSS in `scss/` and place it into `css/`.

### Generate the site

You can leverage the gulpfile to install all dependencies and build the Jekyll site with
the bootstrap task:

```
gulp bootstrap
```

##### Or, you can run everything manually like so:

_It's important to first complete the [build tasks](#build-tasks) to ensure that
the static assets are updated._

* Install the dependencies: `bundle`.
* Build the site: `jekyll build`.
* Run the site locally for development: `jekyll serve --watch`.

## SCSS project structure

```
css/
|
`-- c.css                 # Compiled, prefixed CSS.
`-- c.min.css             # Compiled, prefixed, and minified CSS.

scss/
|
|-- modules/              # Common modules
|   |-- _all.scss         # Include to get all modules
|   |-- _utilities.scss   # Module name
|   |-- _reset.scss       # reset
|   |-- _colors.scss      # Etc...
|   ...
|
|-- partials/             # Partials
|   |-- _base.scss        # imports for all mixins + global project variables
|   |-- _buttons.scss     # buttons
|   |-- _figures.scss     # figures
|   |-- _grids.scss       # grids
|   |-- _typography.scss  # typography
|   ...
|
|-- components/           # Components
|   |-- _posts-list.scss  # styling for the post list component
|   ...
|
|-- variables/            # Variables
|   |-- _base.scss        # base variable declarations
|   ...
|
`-- all.scss              # primary Sass file
```

## Running

* `gulp build`: build everything
* `gulp serve`: build everything, then serve files at localhost:4000
