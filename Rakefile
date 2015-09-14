# TODO colorize logging

require 'rainbow'
require 'yaml'
require 'logger'
require 'open3'

require 'dotenv'
Dotenv.load!

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

module AssetMapper
  ASSET_DIRECTORIES = [
    'fonts/',
    'images/',
    'resources/'
  ]

  class AwsS3Mapper
    attr_reader :destination
    attr_reader :asset_root

    def self.deployer
      mapper = self.new(
        's3://assets.jxf.me/',
        '_src/assets'
      )
      AssetDeployer::S3Deployer.new(mapper)
    end

    def initialize(destination, asset_root)
      @destination  = destination
      @asset_root = asset_root
    end

    def credentials
      ENV
    end

    def asset_directories
      AssetMapper::ASSET_DIRECTORIES
    end

    def source_for(asset_path_from_asset_root)
      File.join(asset_root, asset_path_from_asset_root)
    end

    def destination_for(asset_path_from_asset_root)
      File.join(destination, asset_path_from_asset_root)
    end
  end
end

class AssetDeployer
  class BaseDeployer
    attr_reader :mapper
    attr_reader :credentials

    def initialize(mapper)
      @mapper      = mapper
      @credentials = mapper.credentials
    end
  end

  class S3Deployer < BaseDeployer
    def aws_access_key_id
      credentials.fetch('AWS_ACCESS_KEY_ID')
    end

    def aws_secret
      credentials.fetch('AWS_SECRET_ACCESS_KEY')
    end

    def deploy
      make_bucket mapper.destination
      mapper.asset_directories.each do |dir|
        deploy_files mapper.source_for(dir), mapper.destination_for(dir)
      end
    end

    private

    def issue_s3_command(command)
      execute_command "s3cmd --access_key=#{aws_access_key_id} --secret_key=#{aws_secret} #{command}"
    end

    def make_bucket(destination)
      issue_s3_command "mb #{destination} --verbose"
    end

    def deploy_files(local, remote)
      issue_s3_command "sync -H --verbose #{remote} #{local}"
      issue_s3_command "sync --delete-removed -H --verbose #{local} #{remote}"
    end
  end
end

namespace :environment do
  desc 'report environment variables'
  task 'show' do
    ENV.keys.sort.each do |key|
      logger.debug "#{key}=#{ENV[key]}"
    end
  end
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

  desc 'synchronize with remote assets'
  task :synchronize_remote do
    AssetMapper::AwsS3Mapper.deployer.deploy
  end
end

desc "build assets"
task :assets => ['assets:css:compile', 'assets:synchronize_remote']

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

desc "write CNAME file for GitHub deployments"
task :cname => [:build] do
  logger.info log_message "writing CNAME"
  execute_command %{echo 'jxf.me' > _out/CNAME}
end

desc "deploy site"
task :deploy => [:build, :cname] do
  logger.info log_message "deploying site"
  FileUtils.cd('_out') {
    execute_command 'rm -rf .git'
    execute_command 'git init'
    execute_command 'git add .'
    execute_command 'git commit -m "deployed on: `date -u`"'
    execute_command 'git remote add origin-github-pages git@github.com:fj/fj.github.io.git'
    execute_command 'git push -f origin-github-pages master'
  }
  logger.info log_message "deployment finished"
end

task :default => ['assets:css:lint', 'assets:css:compile']
