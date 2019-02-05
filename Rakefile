# frozen_string_literal: true

require_relative "./lib/colorizer"

def project_name
  "Wildfestival Groningen #WFG 🍺"
end

## Serve
task :serve do
  puts "== Project: " + project_name.green
  system "bundle exec middleman serve"
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
  puts "== Proofing the brew...".green
  system "ruby lib/html_proofer.rb" || exit(1)
end
