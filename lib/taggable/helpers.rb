module Taggable
  module Helpers
    extend ActiveSupport::Concern

    module ClassMethods
      def has_tagger?
        column_names.include?('tagger_id')
      end
    end
  end
end
