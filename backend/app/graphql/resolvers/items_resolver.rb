module Resolvers
  class ItemsResolver < GraphQL::Schema::Resolver
    type [Types::ItemType], null: false

    def resolve
      Item.all
    end
  end
end
