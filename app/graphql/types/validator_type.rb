Types::ValidatorType = GraphQL::ObjectType.define do
  name 'Validator'
  description 'The query root of this schema'

  field :validate_email, types.Boolean do
    description 'Input a email and get some result'
    argument :email, !types.String
    resolve ->(_obj, args, _ctx) {
      args['email'] == 'niklas.hanft@outlook.com'
    }
  end
end
