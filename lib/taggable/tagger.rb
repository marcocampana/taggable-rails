module Taggable
  module Tagger
    extend ActiveSupport::Concern

    included do
      has_many :owned_taggings,   :as => :tagger, :class_name => 'Taggging', :dependent => :destroy
      has_many :owned_tags,       :as => :tagger, :class_name => 'Tag',      :dependent => :destroy
      has_many :owned_tag_groups, :as => :tagger, :class_name => 'TagGroup', :dependent => :destroy
    end
  end
end
