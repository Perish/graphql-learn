class Resolvers::CreateVote < GraphQL::Function
  # 定义参数
  argument :linkId, types.ID

  # 返回类型
  type Types::VoteType

  # 解析器
  def call(_obj, args, ctx)
    Vote.create!(
      link: Link.find_by(id: args[:linkId]),
      user: ctx[:current_user]
    )
  end
end
