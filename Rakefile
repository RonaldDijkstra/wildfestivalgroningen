# frozen_string_literal: true

require_relative "./lib/colorizer"

def project_name
  "Wildfestival Groningen #WFG 🍺"
end

## Serve
namespace :serve do
  def serve(env)
    puts "== Project: " + project_name.green
    puts "== Locale: #{env}"
    system "LOCALE=#{env} bundle exec middleman serve" || exit(1)
  end

  desc "Serve NL"
  task :nl do
    serve :nl
  end

  desc "Serve EN"
  task :en do
    serve :en
  end
end

## Build the website
task :build do
  puts "== Project: " + project_name.green
  puts "== Brewing in verbose mode...".green
  system "bundle exec middleman build --verbose" || exit(1)
end

def git_branch_name
  `git rev-parse --abbrev-ref HEAD`
end

desc "Submits PR to GitHub"
task :pr do
  branch_name = git_branch_name
  if branch_name == "master"
    puts "On master branch, not PRing."
    exit 1
  end

  `git push -u origin #{branch_name}`
  `open https://github.com/RonaldDijkstra/wildfestivalgroningen/compare/#{branch_name}`
end
