# frozen_string_literal: true

require "net/http"
require "uri"
require "yaml"
require "json"
require "fileutils"

uri = URI.parse("https://business.untappd.com/api/v1/sections/350873/items")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Basic anVzdF9pbl9iZWVyQGhvdG1haWwuY29tOlBIeEFUdHJZejZReGh5cjRCc1Zm"

req_options = {
  use_ssl: uri.scheme == "https"
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

if response.code == "200"

  FileUtils.rm_rf("source/blog/beers/.", secure: true)

  result = JSON.parse(response.body, object_class: OpenStruct)

  result.items.each do |doc|
    File.open("source/blog/beers/#{doc.id}.html.markdown", "w") do |f|
      f.write("---\n")
      f.write("title: \"#{doc.name}\"\n")
      f.write("date: #{doc.updated_at}\n")
      f.write("style: \"#{doc.style}\"\n")
      f.write("brewery: \"#{doc.brewery}\"\n")
      f.write("image: \"#{doc.label_image_hd}\"\n")
      f.write("rating: \"#{doc.rating.to_f.round(2)}\"\n")
      f.write("description: \"#{doc.description.gsub(/\n/, " ").gsub(/"/, " ")}\"\n")
      f.write("abv: \"#{doc.abv}\"\n")
      f.write("ibu: \"#{doc.ibu.to_f.round(0)}\"\n")
      f.write("robots: noindex,nofollow\n")
      f.write("---\n")
      f.close
    end
  end
else
  puts "Error retrieving data"
end
