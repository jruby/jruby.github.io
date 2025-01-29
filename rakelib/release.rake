require 'github_api'

def github_milestone_for(issues, user, repo, title)
  ['open', 'closed'].each do |state|
    puts "Title: #{title}"
    issues.milestones.list(user, repo, state: state) do |milestone|
      puts "MT: #{milestone.title}"
      return milestone.number if milestone.title == title
    end
  end
  nil
end

##
# return a list of closed issues in a tuple-format: [github_id, title, url]
# 
def github_closed_issues(user, repo, milestone)
  issues = Github::Client::Issues.new(user: user, repo: repo)
  mid = github_milestone_for(issues, user, repo, milestone)

  return nil if mid == -1

  options = { user: user, repo: repo, milestone: mid.to_s, state: 'closed', per_page: 100 }

  full_list = []
  1.upto(1_000_000) do |i|
    options[:page] = i
    page = issues.list(options).map do |issue|
      ['#' + issue.number.to_s, issue.title, issue.html_url]
    end
    return full_list if page.size == 0
    full_list.concat page
  end
  full_list
end

def grab_username_password_from_m2
  username, password = nil, nil
  File.readlines(File.join(ENV['HOME'], '.m2', 'settings.xml')).each do |line|
    if line =~ /<username>([^<]+)<\/username>/
      username = $1
    elsif line =~ /<password>([^<]+)<\/password>/
      password = $1
    end
  end
  [username, password]
end

# FIXME: It would be nice to make text + markdown/html output at some point
def issue_notes_for(version, issues)
  number_resolved = issues.length
  notes = "\n### #{number_resolved} Issues and PRs resolved for #{version}\n\n"

  issues.reverse.each do |issue|
    notes << %Q{- #{issue[0]} [#{issue[1]}][#{issue[0]}]\n}
  end

  notes << "\n"
  
  issues.reverse.each do |issue|
    notes << %Q{[#{issue[0]}]:#{issue[2]}\n}
  end
  notes
end

def release_issues(version)
  username, password = grab_username_password_from_m2
  options = {:username => username, :password => password, :context_path => '/',
    :site => 'https://jira.codehaus.org/', :auth_type => :basic 
  }

  milestone_label = "JRuby #{version}"
  github_issues = github_closed_issues('jruby', 'jruby', milestone_label)
  issue_notes_for(version, github_issues)
end


def update_for_version(version, major=true)
  post_link = create_post(version)
  change_versions_in('_config.yml', version, post_link)
  change_versions_in('download.html', version, post_link)
end

def create_post(version)
  v = version.gsub('.', '-')
  t = Time.now
  file = t.strftime("_posts/%Y-%m-%d-jruby-#{v}.markdown")
  
  File.open(file, 'w') do |io|
    io.write(boiler_top(version))
    io.write(release_issues(version))
  end

  t.strftime("/%Y/%m/%d/jruby-#{v}")
end

def change_versions_in(filename, version, post_link)
  # we recalc this each time but this is a rakefile :)
  major, second, third, minor = version.split('.')

  fail "third value is not a number: #{third}" unless third =~ /\d+/
  previous_third = third.to_i - 1
  previous_version = [major, second, previous_third, minor].join('.')
  
  windows_version = version.gsub('.', '_')
  previous_windows_version = previous_version.gsub('.', '_')

  # format to match  <a href='/2025/01/21/jruby-9-4-10-0'>release notes</a>
  previous_link_re = %r{/\d+\/\d+\/\d+\/jruby\-#{major}\-#{second}\-#{previous_third}\-#{minor}}
  puts previous_link_re

  # We use full versions since we are doing simple text replacement.  Only
  # subbing on third will replace things we don't want sometimes.

  new_content = File.read(filename).
                  gsub(previous_version, version).
                  gsub(previous_windows_version, windows_version).
                  gsub(previous_link_re, post_link)
  
  File.write(filename, new_content)
end

def boiler_top(version, compat="3.1")=<<~"EOS"
    ---
    layout: post
    title: JRuby #{version} Released
    ---

    The JRuby community is pleased to announce the release of JRuby #{version}.

    * Homepage: [https://www.jruby.org/](https://www.jruby.org/)
    * Download: [https://www.jruby.org/download](https://www.jruby.org/download)

    JRuby #{version.split('.')[0..2].join('.')}.x targets Ruby #{compat} compatibility.

    Thank you to our contributors this release, you help keep JRuby moving forward!

EOS

