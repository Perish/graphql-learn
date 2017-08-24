# 定义一个type
Types::LinkType = GraphQL::ObjectType.define do
  # 定义type的名字
  name 'Link'

  # 定义这个type都有哪些字段
  field :id, !types.ID
  field :url, !types.String
  field :description, !types.String
end
