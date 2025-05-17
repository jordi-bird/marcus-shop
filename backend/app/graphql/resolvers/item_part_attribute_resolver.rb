module Resolvers
    class ItemPartAttributeResolver < GraphQL::Schema::Resolver
      type Types::ItemPartAttributeType, null: false
      argument :id, ID, required: true
  
      def resolve(id:)
        ItemPartAttribute.find(id)
      end
    end
  end
  