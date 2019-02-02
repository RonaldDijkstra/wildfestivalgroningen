def name
  "Wildfestival Groningen #WFG 🍺"
end

## Serve
task :serve do
  puts "== Project: " + name
  system "bundle exec middleman serve"
end

## Clean build the website
task :build do
  puts "== Project: " + name
  puts "== Brewing in clean mode..."
  system "bundle exec middleman build --clean" or exit(1)
end
