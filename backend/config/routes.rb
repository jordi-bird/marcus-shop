# config/routes.rb
Rails.application.routes.draw do
  if Rails.env.development? # Només desenvolupament
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  match "/graphql", via: [:options], to: proc { [204, {}, ['']] }
end