module Jekyll
  class ImagesBlock < Liquid::Block

    def initialize(tag_name, text, token)
      super
      @text = text
    end

    def render(context)
      converter = context.registers[:site].find_converter_instance(::Jekyll::Converters::Markdown)
      content = converter.convert(super(context))
      images = content.gsub("<p>", "").gsub("</p>", "").split("\n").reject(&:empty?)

      output = '<div class="images-row">'
      images.each {|img| output += '<div class="images-row__wrapper">' + img + '</div>'}
      output += '</div>'

      output
    end
  end
end
Liquid::Template.register_tag('images', Jekyll::ImagesBlock)
