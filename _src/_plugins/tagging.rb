module Jekyll
  class TagIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag

      tag_title_prefix = site.config['tag_title_prefix'] || 'Posts Tagged &ldquo;'
      tag_title_suffix = site.config['tag_title_suffix'] || '&rdquo;'

      self.data['title'] = "#{ tag_title_prefix }#{ tag }#{ tag_title_suffix }"
    end
  end

  class TagGenerator < Generator
    safe true

    def generate(site)
      tags = all_site_tags(site)

      if site.layouts.key? 'tag_index'
        dir = site.config['tag_dir'] || 'tag'
        tags.keys.each do |tag|
          write_tag_index(site, File.join(dir, tag), tag)
        end
      end
    end

    def all_site_tags(site)
      self.computed_site_tags(site).merge(site.tags) { |k, v_old, v_new| v_old | v_new }
    end

    def computed_site_tags(site)
      tags = site.collections['entries'].docs.inject({}) do |h, d|
        # Add document type as a tag ('post', 'review', 'essay', etc.).
        d.data['tags'] ||= []
        d.data['tags'].unshift d.data['type']
        h[d.data['type']] ||= []
        h[d.data['type']] << d

        Array.new(d.data['tags']).each do |tag|
          h[tag] ||= []
          h[tag] << d
        end
        h
      end
    end

    def write_tag_index(site, dir, tag)
      index = TagIndex.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end
