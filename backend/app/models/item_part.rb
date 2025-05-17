class ItemPart < ApplicationRecord
  belongs_to :item
  belongs_to :parent, class_name: "ItemPart", optional: true

  has_many :children, class_name: "ItemPart", foreign_key: :parent_id, dependent: :destroy
  has_many :item_part_attributes, dependent: :destroy

  validates :name, presence: true
end
