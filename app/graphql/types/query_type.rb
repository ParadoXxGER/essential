Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your

  field :findUserById do
    type Types::UserType
    description "Query a user"
    argument :id, !types.ID
    resolve ->(obj, args, ctx){ User.find(args["id"]) }
  end

  field :findUserByEmail do
    type Types::UserType
    description "Query a user"
    argument :email, !types.String
    resolve ->(obj, args, ctx){ User.find_by(email: args["email"]) }
  end

  field :findAllUser do
    type Types::UserType
    description "Query all user"
    resolve ->(obj, args, ctx){ User.all }
  end

end
