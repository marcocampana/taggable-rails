module Taggable
  module Tag
    extend ActiveSupport::Concern

    included do
      include Helpers

      belongs_to :tag_group
      belongs_to :tagger, :polymorphic  => true if has_tagger?
      has_many   :taggings

      validates :name,
                :presence   => true,
                :uniqueness => {:case_sensitive => false, :scope => has_tagger? ? [:tagger_id, :tagger_type] : nil }
    end
  end
end
