require 'compass-core'
require 'rexml/document'

Compass::Core::SassExtensions::Functions::ImageSize::KNOWN_TYPES << 'svg'
Compass::Core::SassExtensions::Functions::ImageSize::ImageProperties.class_exec do
  private 
    def get_size_for_svg
      svg = File.read(@file)
      doc = REXML::Document.new(svg)
      [doc.root.attributes['width'].to_i, doc.root.attributes['height'].to_i]     
    end
end