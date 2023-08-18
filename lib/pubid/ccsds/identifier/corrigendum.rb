module Pubid::Ccsds
  module Identifier
    class Corrigendum < Base
      def_delegators 'Pubid::Ccsds::Identifier::Corrigendum', :type

      attr_accessor :base

      def initialize(base: nil, **opts)
        super(**opts)
        @base = base
      end

      def self.type
        { key: :corrigendum, title: "Corrigendum" }
      end

      def self.get_renderer_class
        Renderer::Corrigendum
      end
    end
  end
end
