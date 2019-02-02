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
  puts "== Project: " + project_name.green
  puts "== Brewing in verbose mode...".green
  system "bundle exec middleman build --verbose" or exit(1)
end
