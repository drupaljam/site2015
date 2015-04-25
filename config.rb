require 'lib/compass_ext'

sprockets.import_asset 'sponsor-logos.css'

ignore 'stylesheets/sponsor-logos.scss.erb'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :fonts_dir, 'fonts'

# Used for generating absolute URLs
set :protocol, "http://"
# in our server configuration, this a quite reliable way of figuring out the hostname
set :host, File.basename(File.dirname(File.dirname(__FILE__))) 
set :port, 80

configure :development do
  set :host, Middleman::PreviewServer.host
  set :port, Middleman::PreviewServer.port
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :minify_html

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
