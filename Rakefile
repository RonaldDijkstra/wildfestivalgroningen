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

## Build the website
task :build do
  puts "== Project: " + name
  puts "== Brewing... 🍺"
  system "bundle exec middleman build --verbose" or exit(1)
end

## Test the build
task :test do
  Rake::Task["build"].invoke
  puts "== Drinking... 🍺"
  system "ruby test.rb"
  puts "Brewed & Tested"
end
