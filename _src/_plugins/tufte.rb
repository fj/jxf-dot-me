module Jekyll
  class MarginNotes < Liquid::Block
    alias_method :render_block, :render
    @@margincount = Hash.new(0)

    def initialize(tag_name, reference, tokens)
      super
      @reference = reference
    end

    def render(context)
      # If reference is not manually set, use the automatic increment system
      page_url = context.environments.first["page"]["url"]
      @@margincount[page_url] += 1
      if @reference !~ /[^[:space:]]/
        @reference = "marginnote-#{@@margincount[page_url]}"
      end
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
    @@sidenotecount = Hash.new(0)

    def initialize(tag_name, reference, tokens)
      super
      @reference = reference
    end

    def render(context)
      # If reference is not manually set, use the automatic increment system
      page_url = context.environments.first["page"]["url"]
      @@sidenotecount[page_url] += 1
      if @reference !~ /[^[:space:]]/
        @reference = "sidenote-#{@@sidenotecount[page_url]}"
      end
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
