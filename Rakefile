## Serve
namespace :serve do
  def serve(env)
    puts "== Project: Wildfestival Groningen #WFG (#{env.upcase}) 🍺"
    system "LOCALE=#{env} bundle exec middleman serve"
  end

  desc "Wildfestival - Nederlandstalig"
  task :nl do
    serve :nl
  end

  desc "Wildfestival - English"
  task :en do
    serve :en
  end
end
