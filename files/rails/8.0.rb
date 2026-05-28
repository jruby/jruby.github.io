# JRuby template for `rails new --template ...`

# 1. We let Rails generate the default Gemfile first.
# 2. We use an after_bundle block or direct manipulation to swap it before bundling completes.

# Replace database driver gem with activerecord-jbdbc-adapter
case options[:database]
when "sqlite3"
  gsub_file "Gemfile", /gem "sqlite3".*$/, 'gem "activerecord-jdbcsqlite3-adapter", "80.0.pre1"'
when "mysql"
  gsub_file "Gemfile", /gem "mysql2".*$/, 'gem "activerecord-jdbcmysql-adapter", "80.0.pre1"'
when "postgresql"
  gsub_file "Gemfile", /gem "pg".*$/, 'gem "activerecord-jdbcpostgresql-adapter", "80.0.pre1"'
else
  say "Unsupported database: #{options[:database]}", :red
  exit 1
end

after_bundle do
  say "Gemfile customized for JDBC and dependencies bundled successfully!", :green
end

