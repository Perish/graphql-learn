class Resolvers::CreateLink < GraphQL::Function
  # 接收的参数
  argument :description, !types.String
  argument :url, !types.String

  # 变更后返回的类型
  type Types::LinkType

  # the mutation method
  # _obj 是父对象，这里是nil
  # args 是传入的参数
  # _ctx 是graphql上下文
  def call(_obj, args, _ctx)
    Link.create!(
      description: args[:description],
      url: args[:url]
    )
  end 
end
