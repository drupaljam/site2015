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


after_build do |builder|
  require 'fileutils'

  app = builder.class.shared_instance
  dir = Pathname(app.build_dir)

  Dir[dir.join('images/badges/*.svg')].each do |src|
    x = File.basename(src).split('.')

    src_path  = Dir[File.join(File.dirname(src), x.first.split('-').first(2).join('-') + '-*.png')].first

    dest_name = x.first + '.png'
    dest_path = File.join(File.dirname(src), dest_name)

    FileUtils.cp src_path, dest_path
  end
end