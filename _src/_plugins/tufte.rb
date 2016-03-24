module Jekyll
  class MarginNotes < Liquid::Block
    alias_method :render_block, :render
    @@margincount = 0;

    def initialize(tag_name, reference, tokens)
      super
      @reference = reference
      @@margincount += 1;
      if @reference !~ /[^[:space:]]/
        @reference = "marginnote-#{@@margincount}";
      end
    end

    def render(context)
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
      content = converter.convert(super(context))
      content.gsub! '<p>', ''
      content.gsub! '</p>', ''
      "<label for=\"#{@reference}\" class=\"margin-toggle\">&#8853;</label><input type=\"checkbox\" id=\"#{@reference}\" class=\"margin-toggle\"/><span class=\"marginnote\">#{content}</span>"
    end
  end

  class SideNotes < Liquid::Block
    alias_method :render_block, :render
    @@sidenotecount = 0;

    def initialize(tag_name, reference, tokens)
      super
      @reference = reference
      @@sidenotecount += 1;
      if @reference !~ /[^[:space:]]/
        @reference = "sidenote-#{@@sidenotecount}";
      end
    end

    def render(context)
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
      content = converter.convert(super(context))
      content.gsub! '<p>', ''
      content.gsub! '</p>', ''
      "<label for=\"#{@reference}\" class=\"margin-toggle sidenote-number\"></label><input type=\"checkbox\" id=\"#{@reference}\" class=\"margin-toggle sidenote-number\"/><span class=\"sidenote\">#{content}</span>"
    end
  end
end

Liquid::Template.register_tag('margin', Jekyll::MarginNotes)
Liquid::Template.register_tag('sidenote', Jekyll::SideNotes)
