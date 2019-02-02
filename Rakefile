require_relative "./lib/colorizer"

def project_name
  "Wildfestival Groningen #WFG 🍺"
end

## Serve
task :serve do
  puts "== Project: " + project_name.green
  system "bundle exec middleman serve"
end

## Clean build the website
task :build do
  puts "== Project: " + project_name
  puts "== Brewing in superclean mode...".green
  system "bundle exec middleman build --clean" or exit(1)
end

## Test with verbose build
task :test do
  puts "== Project: " + project_name
  puts "== Brewing in verbose mode..."
  system "bundle exec middleman build --verbose" or exit(1)
  puts "== Drinking..."
  system "ruby test.rb"
  puts "Brewed & Tested 🍺🍺🍺"
end
