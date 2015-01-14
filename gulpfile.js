/// need to copy files last so they don't get clobbered by jekyll steps

var gulp    = require('gulp'),
    gutil   = require('gulp-util'),
    sass    = require('gulp-sass'),
    rename  = require('gulp-rename'),
    cssmin  = require('gulp-minify-css'),
    concat  = require('gulp-concat'),
    uglify  = require('gulp-uglify'),
    jshint  = require('gulp-jshint'),
    csslint = require('gulp-csslint'),
    prefix  = require('gulp-autoprefixer'),
    size    = require('gulp-size'),
    run   = require('gulp-run');

gulp.task('scss', function() {
  return gulp.src('_src/_scss/all.scss')
    .pipe(sass())
    .pipe(size({ gzip: true, showFiles: true }))
    .pipe(prefix())
    .pipe(rename('c.css'))
    .pipe(gulp.dest('_src/assets/css'))
    .pipe(cssmin())
    .pipe(size({ gzip: true, showFiles: true }))
    .pipe(rename({ suffix: '.min' }))
    .pipe(gulp.dest('_src/assets/css'));
});

gulp.task('csslint', ['scss'], function() {
  gulp.src('_src/assets/css/c.css')
    .pipe(csslint({
      'import': false,
      'unqualified-attributes': false,
      'outline-none': false,
      'compatible-vendor-prefixes': false,
      'font-sizes': false,
      'box-sizing': false,
      'known-properties': false,
      'unique-headings': false,
      'regex-selectors': false
    }))
    .pipe(csslint.reporter());
});

gulp.task('js', function() {
  gulp.src('_src/_js/src/**/*.js')
    .pipe(uglify())
    .pipe(size({ gzip: true, showFiles: true }))
    .pipe(concat('j.js'))
    .pipe(gulp.dest('_src/assets/js'));
});

gulp.task('jshint', ['js'], function() {
  gulp.src('_src/assets/js/**/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter('default'));
});

gulp.task('watch', function() {
  gulp.watch('_src/_scss/**/*.scss', ['scss', 'csslint']);
  gulp.watch('_src/_js/**/*.js', ['jshint', 'js']);
});

gulp.task('build', ['scss', 'js'], function() {
  run('jekyll build --config _src/_config.yml').exec(function() {
    gutil.log(gutil.colors.green('jekyll build complete'));
  });
});

gulp.task('serve', ['scss', 'csslint', 'js', 'jshint'], function() {
  run('jekyll serve --verbose --config _src/_config.yml').exec();
});

gulp.task('bootstrap', function() {
  run('npm i').exec(function() {
    gutil.log(gutil.colors.green('[npm i] npm dependencies installed'));

    run('bundle').exec(function() {
      gutil.log(gutil.colors.green('[bundle] Ruby dependencies installed'));

      gulp.start('serve', function() {
        gutil.log(gutil.colors.green('[serve] building site'));
      });
    });
  });
});

gulp.task('default', ['scss', 'csslint', 'js', 'jshint', 'watch']);
