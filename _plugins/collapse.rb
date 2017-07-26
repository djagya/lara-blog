module Jekyll
  class CollapseBlock < Liquid::Block

    def initialize(tag_name, text, token)
      super
      @text = text
    end

    def render(context)
      converter = context.registers[:site].find_converter_instance(::Jekyll::Converters::Markdown)
      content = converter.convert(super(context))

      output = "<div class='collapse'><a href='#' class='collapse__expand'>> #{@text}</a><div class='collapse__content'>#{content}</div></div>"

      return output
    end
  end
end
Liquid::Template.register_tag('collapse', Jekyll::CollapseBlock)
