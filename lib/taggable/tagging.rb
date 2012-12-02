module Taggable
  module Tagging
    extend ActiveSupport::Concern

    included do
      belongs_to :tag
      belongs_to :tagged, :polymorphic => true
      belongs_to :tagger, :polymorphic => true
    end
  end
end
