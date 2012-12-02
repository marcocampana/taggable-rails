module Taggable
  module TagGroup
    extend ActiveSupport::Concern

    included do
      include Helpers

      belongs_to :tagger, :polymorphic  => true if has_tagger?
      has_many   :tags,   :dependent => :destroy

      validates :name,
                :presence => true,
                :uniqueness => {:case_sensitive => false, :scope => has_tagger? ? [:tagger_id, :tagger_type] : nil }
    end
  end
end
