# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.0"

# Middleman Core & Extensions
gem "middleman"
gem "middleman-autoprefixer"
gem "middleman-inline_svg"
gem "middleman-minify-html"
gem "middleman-sprockets"

# Templating Engines
gem "builder"
gem "redcarpet"
gem "sassc"

# Asset Pipeline Gems
gem "bourbon"
gem "neat"

# Extensions
gem "html-proofer"
gem "rake"

# Frontend
source "https://rails-assets.org" do
  gem "rails-assets-jquery"
  gem "rails-assets-what-input"
end

# Linters (not required)
gem "rubocop", require: false
gem "scss_lint", require: false 

# Windows support

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.1", platforms: %i[mswin mingw]

# Windows does not come with time zone data
gem "tzinfo-data", platforms: %i[mswin mingw jruby]
