module Resolvers
    class GetItemPart < GraphQL::Schema::Resolver
      type Types::ItemPartType, null: false
  
      argument :id, ID, required: true
  
      def resolve(id:)
        ItemPart.find(id)
      end
    end
end
  