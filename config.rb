# frozen_string_literal: true

# Set the locale
root_locale = :en

# Accessible as `root_locale` in helpers and `config[:root_locale]` in templates
set :root_locale, root_locale

# Load Sass from node_modules
config[:sass_assets_paths] << File.join(root, "node_modules")

# Activate i18n for root locale
activate :i18n, mount_at_root: root_locale, langs: %i[en]
activate :autoprefixer
activate :directory_indexes
activate :inline_svg

activate :dato, live_reload: true
# enable livereload on development

# Set timezone
Time.zone = "CET"

# Set Google Analytics id
set :ga_code, "UA-24956010-6"

# Ignore the selection file for Icomoon
ignore "assets/fonts/selection.json"

set :css_dir, "assets/stylesheets"
set :fonts_dir, "assets/fonts"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"

# Handled by Webpack
ignore File.join(config[:js_dir], '*')
ignore File.join(config[:css_dir], '*')

# Use redcarpet for markdown
set :markdown_engine, :redcarpet

page "/*.json", layout: false
page "/*.txt", layout: false
page "/*.xml", layout: false

activate :external_pipeline,
         name: :webpack,
         command: build? ? 'yarn run build' : 'yarn run start',
         source: "dist",
         latency: 1

configure :development do
  activate :livereload
end

# Settings for production
configure :production do
  activate :asset_hash, ignore: [
    %r{^assets/fonts/.*},
    "assets/images/logo-wild-festival-groningen.svg"
  ]
  activate :gzip
  activate :minify_css
  activate :minify_html
  activate :minify_javascript

  # Raise exception for missing translations during build
  require "lib/test_exception_localization_handler"

  I18n.exception_handler = TestExceptionLocalizationHandler.new
end

after_build do
  redirects = YAML.load_file("data/redirects.yml")

  File.open("build/_redirects", "w+") do |f|
    redirects.each { |element| f.puts(element + " 301") }
  end
end
