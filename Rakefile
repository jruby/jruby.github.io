begin
  require 'bundler'
  Bundler.setup
rescue LoadError
  puts "Please install Bundler and run 'bundle install' to ensure you have all dependencies"
end

desc "Clean the site"
task :clean do
  rm_rf "_site"
end

desc "Generate the site using Jekyll"
task :generate => :check_pygments do
  ruby "-S bundle exec jekyll"
end
task :gen => :generate

desc "Run a file server that serves and regenerates the files"
task :server  do
  ruby "-S bundle exec rackup"
end

desc "Deploy the files to jruby.org"
task :deploy => :generate do
  sh "tar -C _site/ -zcf - . | ssh deploy@jruby.org 'cd /data/jruby.org && tar zxf -'"
end

desc "Deploy jruby.org config changes"
task :cookbooks do
  Bundler.with_clean_env do
    sh "ey recipes upload --environment jruby_ci --apply"
  end
end

task :nginx => :cookbooks

desc "Down resolved issues based on ENV[JRUBY_VERSION]"
task :issues do
  version = ENV['JRUBY_VERSION'] || fail("No JRUBY_VERSION env set")
  username, password = grab_username_password_from_m2
  options = {:username => username, :password => password, :context_path => '/',
    :site => 'https://jira.codehaus.org/', :auth_type => :basic 
  }

  puts release_issues(version, options)
end

task :default do
  puts "JRuby.org documentation site. Available tasks:"
  Rake.application.options.show_tasks = true
  Rake.application.options.full_description = false
  Rake.application.options.show_task_pattern = //
  Rake.application.display_tasks_and_comments
end

task :check_pygments do
  `which pygmentize`
  $?.success? or raise "Pygments not installed, see http://pygments.org/docs/installation/"
end

desc "Create browsable index.html files for S3"
task :indexes do
  top = "www/files"
  mkdir_p top, :verbose => false
  sorted_files.each do |dir,entries|
    mkdir_p File.expand_path(File.join(top, dir)), :verbose => false
    File.open(File.expand_path(File.join(top, dir, "index.html")), "wb") do |html|
      write_index_html(html, dir, entries)
    end
  end
end

task :update_hash_files do
  jruby_org_bucket.files.tap {|fs| fs.prefix = 'downloads/' }.each do |file|
    next unless file.key =~ /\.(md5|sha1)$/
    unless file.content_type == "text/plain"
      puts "Updating #{file.key} to Content-Type: text/plain"
      file.content_type = "text/plain"
      file.public = true
      file.save
    end
  end
end

desc "Print a summary of yesterday's file downloads"
task :download_summary do
  jruby_download_summary ENV['DATE'], ENV['OUTPUT']
end
