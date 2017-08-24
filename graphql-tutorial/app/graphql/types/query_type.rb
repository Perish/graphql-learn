Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  # 查询只是表示为字段
  field :allLinks, !types[Types::LinkType] do
    # 为了取数据，解析器会被执行
    resolve -> (obj, args, ctx) { Link.all }
  end 
                          
end
