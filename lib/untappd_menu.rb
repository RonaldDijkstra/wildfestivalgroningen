# frozen_string_literal: true

require "net/http"
require "uri"
require "yaml"
require "json"

uri = URI.parse("https://business.untappd.com/api/v1/sections/350873/items")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Basic"

req_options = {
  use_ssl: uri.scheme == "https"
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

File.open("data/menu.yml", "w") do |f|
  f.write(JSON.parse(response.body).to_yaml)
end
