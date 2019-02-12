# frozen_string_literal: true

require_relative "./lib/colorizer"

def project_name
  "Wildfestival Groningen #WFG 🍺"
end

## Serve
task :serve do
  puts "== Project: " + project_name.green
  puts "== Retrieving external data..."
  system "ruby lib/untappd_menu.rb" || exit(1)
  puts "== Start server..."
  system "bundle exec middleman serve" || exit(1)
end

## Build the website
task :build do
  puts "== Project: " + project_name.green
  puts "== Brewing in verbose mode...".green
  system "bundle exec middleman build --verbose" || exit(1)
end

## Build & Proof
task :proof do
  puts "== Project: " + project_name.green
  puts "== Brewing in verbose mode...".green
  system "bundle exec middleman build --verbose" || exit(1)
  # Run html-proofer with options
  puts "== Proofing the brew...".green
  system "ruby lib/html_proofer.rb" || exit(1)
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
