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
def issue_notes_for(name, version, issues, notes)
  notes << "\n### #{name} Issues resolved for #{version}\n\n"
  do_references = ENV['REFERENCES']

  issues.reverse.each do |issue|
    if do_references
      notes << %Q{[#{issue[0]}]:#{issue[2]}\n}
    else
      notes << %Q{- [#{issue[0]} - #{issue[1]}](#{issue[2]})\n}
    end
  end
  notes
end

def release_issues(version, options)
  milestone_label = "JRuby #{version}"
  github_issues = github_closed_issues('jruby', 'jruby', milestone_label)

  number_resolved = github_issues.length

  notes = "- #{number_resolved} issues fixed for #{version}\n"
  notes = issue_notes_for('Github', version, github_issues, notes)
  notes
end
