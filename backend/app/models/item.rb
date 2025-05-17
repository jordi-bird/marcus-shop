class Item < ApplicationRecord    
    has_many :item_parts, -> { where(parent_id: nil) }, dependent: :destroy
    has_many :all_item_parts, class_name: 'ItemPart', dependent: :destroy

    validates :name, presence: true
end