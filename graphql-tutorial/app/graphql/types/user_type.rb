Types::UserType = GraphQL::ObjectType.define do
  # 名称
  name 'User'

  # 属性
  field :id, !types.ID
  field :name, !types.String 
  field :email, !types.String 
end
