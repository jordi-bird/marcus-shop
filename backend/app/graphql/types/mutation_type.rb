# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_item, mutation: Mutations::CreateItem
    field :update_item, mutation: Mutations::UpdateItem
    field :delete_item, mutation: Mutations::DeleteItem
    field :create_item_part, mutation: Mutations::CreateItemPart
    field :update_item_part, mutation: Mutations::UpdateItemPart
    field :delete_item_part, mutation: Mutations::DeleteItemPart
    field :create_item_part_attribute, mutation: Mutations::CreateItemPartAttribute
    field :update_item_part_attribute, mutation: Mutations::UpdateItemPartAttribute
    field :delete_item_part_attribute, mutation: Mutations::DeleteItemPartAttribute
    field :create_item_part_attribute_option, mutation: Mutations::CreateItemPartAttributeOption
    field :update_item_part_attribute_option, mutation: Mutations::UpdateItemPartAttributeOption
    field :delete_item_part_attribute_option, mutation: Mutations::DeleteItemPartAttributeOption

  end
end
