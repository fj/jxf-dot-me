module Jekyll
  class EventCategoryIndex < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'event_category_index.html')
      self.data['category'] = category
      self.data['title'] = category.titleize
      self.data['events'] = get_events_for_category(category)
    end

    def get_events_for_category(category)
      @site.collections['events'].docs.select do |e|
        e.data['categories'].include?(category)
      end
    end
  end

  class EventCategoryGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'event_category_index'
        dir = site.config['event_category_dir'] || 'event_category'

        get_event_categories(site).each do |category|
          write_category_index(site, File.join(dir, category), category)
        end
      end
    end

    def write_category_index(site, dir, category)
      index = EventCategoryIndex.new(site, site.source, dir, category)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end

    def get_event_categories(site)
      site.collections['events'].docs.map { |e| e.data['categories'] }.flatten.uniq
    end
  end
end
