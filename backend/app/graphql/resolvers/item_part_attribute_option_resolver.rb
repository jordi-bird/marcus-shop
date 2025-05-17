module Resolvers
    class ItemPartAttributeOptionResolver < GraphQL::Schema::Resolver
      type Types::ItemPartAttributeOptionType, null: false
      argument :id, ID, required: true
  
      def resolve(id:)
        ItemPartAttributeOption.find(id)
      end
    end
  end
  