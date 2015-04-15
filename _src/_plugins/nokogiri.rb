module Nokogiri
  module XML
    class NodeSet
      def to_liquid
        self
      end
    end
    class Element
      def to_liquid
        self
      end
    end
  end
end