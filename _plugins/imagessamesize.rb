require 'rexml/document'

module Jekyll
  class ImagesSameSizeBlock < Liquid::Block

    def initialize(tag_name, text, token)
      super
      @text = text
    end

    def render(context)
      converter = context.registers[:site].find_converter_instance(::Jekyll::Converters::Markdown)
      content = converter.convert(super(context))

      doc = REXML::Document.new(content)
      images = doc.get_elements('//p/img')

      output = '<div class="images-row">'
      images.each {|img| output += "<div class='images-row__wrapper'>"\
        "<div><img src='#{img.attribute('src').to_s}'></div>"\
        "</div>"
      }
      output += '</div>'

      output
    end
  end
end
Liquid::Template.register_tag('imagessamesize', Jekyll::ImagesSameSizeBlock)
