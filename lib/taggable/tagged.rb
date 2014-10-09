module Taggable
  module Tagged
    extend ActiveSupport::Concern

    included do
      has_many :taggings,
               -> { includes(:tag) },
               as: :tagged,
               dependent: :destroy

      has_many :tags, :through => :taggings do
        def tagged_by(tagger)
          where(:taggings => {:tagger_id => tagger.id, :tagger_type => tagger.class.name})
        end
      end
    end

    def tag!(opts)
      raise("You need to specify tags using :with") unless opts.has_key?(:with)

      tags   = opts[:with].is_a?(Array) ? opts[:with] : [opts[:with]]
      tagger = opts[:by]

      existing_taggings = taggings.pluck(:tag_id)

      tags.each do |tag|
        taggings << ::Tagging.new(:tag => tag, :tagger => tagger) unless existing_taggings.include?(tag.id)
      end
    end

    def remove_tags!(tags)
      taggings.where(:tag_id => tags).destroy_all
    end

  end
end
