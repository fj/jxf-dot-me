module Jekyll
  module ByGroupFilter
    def by_group(input, size = 3)
      input.each_slice(size).to_a
    end
  end
end

Liquid::Template.register_filter(Jekyll::ByGroupFilter)