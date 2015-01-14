# TODO colorize logging

require 'rainbow'
require 'yaml'
require 'logger'
require 'open3'

def logger
  @logger ||= Logger.new(STDOUT).tap { |l|
    l.level = Logger::DEBUG
  }
end

def execute_command(c)
  logger.info log_message "run: #{c}", :yellow
  output = `#{c}`
  (logger.debug "\n" + output) if output
end

def log_message(message, color = :blue)
  Rainbow(message).send(color)
end

def configuration
  @configuration ||= YAML.load_file('./_src/_config.yml')
end

def configuration_for(key)
  keys = key.split('.')
  keys.inject(configuration) { |h, k| h = h[k] }
end

namespace :assets do
  desc 'compile SCSS ⇒ CSS, minified CSS'
  task 'css:compile' do
    logger.info log_message "compiling CSS"
    asset_mapping = {
      'all' => 'c'
    }

    asset_mapping.each { |source, destination|
      source_scss_asset          = File.join("#{configuration_for('mappings.scss.source')}", "#{source}.scss")
      destination_asset          = File.join("#{configuration_for('mappings.scss.output')}", "#{destination}.css")
      destination_minified_asset = File.join("#{configuration_for('mappings.scss.output')}", "#{destination}.min.css")
      logger.info log_message "writing #{source_scss_asset} => #{destination_asset}"
      execute_command "sass --scss #{source_scss_asset} #{destination_asset}"
      logger.info log_message "writing #{source_scss_asset} => #{destination_minified_asset}"
      execute_command "sass --scss #{source_scss_asset} #{destination_minified_asset} --style compressed"
    }
  end

  desc 'verify SCSS'
  task 'css:lint' => ['assets:css:compile'] do
    source_scss_directory = configuration_for 'mappings.scss.source'
    logger.info log_message "checking #{source_scss_directory} with scss-lint"
    execute_command("scss-lint #{source_scss_directory}")
  end

  desc 'compile JS ⇒ minified JS'
  task 'js:compile' do
    raise NotImplementedError.new('no processing pipeline for JS files yet')
  end

  desc 'verify JS'
  task 'js:lint' => ['assets:js:compile'] do
    raise NotImplementedError.new('no processing pipeline for JS files yet')
  end
end

desc "build assets"
task :assets => ['assets:css:compile']

desc "build site"
task :build => [:assets] do
  logger.info log_message "building site"
  execute_command "jekyll build --trace --verbose --config _src/_config.yml"
end

desc "clean site"
task :clean do
  logger.info log_message "cleaning site"
  execute_command 'rm -rf _out'
  execute_command 'rm -rf _src/.jekyll-metadata'
end

desc "serve site"
task :serve => [:clean, :build] do
  logger.info log_message "serving site"
  execute_command 'jekyll serve --verbose --config _src/_config.yml'
end

desc "deploy site"
task :deploy => [:build] do
  logger.info log_message "deploying site"
  FileUtils.cd('_out') {
    execute_command 'rm -rf .git'
    execute_command 'git init'
    execute_command 'git add .'
    execute_command 'git commit -m "`date -u`"'
    execute_command 'git remote add origin-github-pages git@github.com:fj/fj.github.io.git'
    execute_command 'git push -f origin-github-pages master'
  }
  logger.info log_message "deployment finished"
end

task :default => ['assets:css:lint', 'assets:css:compile']
