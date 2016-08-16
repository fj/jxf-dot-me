module Jekyll
  class CollectionEnhancer < Generator
    safe true
    priority :high

    def generate(site)
      site.collections.each do |name, collection|
        generate_permalinks name, collection
        assign_date_metadata_from_resource_date_range collection
        assign_title_metadata_from_resource_topic collection
        assign_navigation_links collection
        assign_asset_paths name, collection
        assign_default_item_type_from_refname collection
      end
    end

    def generate_permalinks(collection_name, collection)
      collection.docs.each do |d|
        refname = refname_for(collection)
        _, doc_id, doc_title = collection_segments_for(d, refname)
        raise ArgumentError, "couldn't find a title" unless doc_title

        constructed_slug = doc_title
        d.data['permalink'] = "/#{collection_name}/#{constructed_slug}/"

        if !doc_id.empty?
          d.data['doc_id'] = "#{collection_name}-#{doc_id}"
        end
      end
    end

    def refname_for(collection)
      collection.metadata.fetch 'refname'
    end

    def collection_segments_for(document, refname)
      r = %r{^(.*?)-?#{refname}-(.*)$}
      r.match(document.basename_without_ext).to_a
    end

    def assign_date_metadata_from_resource_date_range(collection)
      r = refname_for(collection)
      collection.docs.select { |d|
        d.data.dig(r, 'date_range') && !d.data['date']
      }.each { |d|
        d.data['date'] = Date.parse(d.data.dig(r, 'date_range').to_s.split('⋯').first)
      }
    end

    def assign_title_metadata_from_resource_topic(collection)
      r = refname_for(collection)
      collection.docs.select { |d|
        d.data.dig(r, 'name') && d.data.dig(r, 'topic') && !d.data['title']
      }.each { |d|
        d.data['title'] = "#{d.data.dig(r, 'name')}: \"#{d.data.dig(r, 'topic')}\""
      }
    end

    def assign_navigation_links(collection)
      sorted_collection(collection).each_cons(2) do |d1, d2|
        d2.data['previous'] = navigation_hash_for_document d1
        d1.data['next']     = navigation_hash_for_document d2
      end
    end

    def assign_default_item_type_from_refname(collection)
      collection.docs.each do |d|
        d.data['type'] ||= refname_for(collection)
      end
    end

    def assign_asset_paths(collection_name, collection)
      collection.docs.each do |d|
        _, doc_id, doc_title = collection_segments_for(d, refname_for(collection))
        d.data['asset_path'] = "//s3.amazonaws.com/assets.jxf.me"
        d.data['image_asset_path'] = "#{d.data['asset_path']}/images/#{collection_name}/#{doc_id}"
      end
    end

    def sorted_collection(collection)
      sort_field = collection.metadata.fetch 'sort_by', 'date'
      collection_sorted_by_field(collection, sort_field)
    end

    def collection_sorted_by_field(collection, field)
      if collection.docs.all? { |d| !!d.data[field] }
        collection.docs.sort_by { |d| d.data.fetch(field) }
      else
        collection.docs.sort_by(&:"#{field}")
      end
    end

    def navigation_hash_for_document(d)
      {'title' => d.data['title'], 'url' => d.url}
    end
  end
end
