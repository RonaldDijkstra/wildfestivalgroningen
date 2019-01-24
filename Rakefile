def name
  "Wildfestival Groningen #WFG 🍺"
end

## Serve
namespace :serve do
  def serve(env)
    puts "== Project: " + name
    puts "== Locale: " + env.upcase.to_s
    system "LOCALE=#{env} bundle exec middleman serve"
  end

  desc "Serve the website in NL"
  task :nl do
    serve :nl
  end

  desc "Serve the website in EN"
  task :en do
    serve :en
  end
end

## Clean build the website
task :build do
  puts "== Project: " + name
  puts "== Brewing in clean mode..."
  system "bundle exec middleman build --clean" or exit(1)
end

## Test with verbose build
task :test do
  puts "== Project: " + name
  puts "== Brewing in verbose mode..."
  system "bundle exec middleman build --verbose" or exit(1)
  puts "== Drinking..."
  system "ruby test.rb"
  puts "Brewed & Tested 🍺🍺🍺"
end
