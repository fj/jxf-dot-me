require 'nokogiri'

module Liquid
  module FilterExtensions
    def html_first_par(text)
      doc = Nokogiri::HTML::DocumentFragment.parse text
      p = doc.xpath('./p[1]')
    end

    def preview(text, delimiter = '<!-- end preview -->')
      if text.index(delimiter) != nil
        text.split(delimiter)[0]
      else
        html_first_par(text)
      end
    end
  end

  Liquid::Template.register_filter(FilterExtensions)
end
