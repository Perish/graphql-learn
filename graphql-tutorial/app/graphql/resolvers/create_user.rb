class Resolvers::CreateUser < GraphQL::Function
  # 定义参数
  AuthProviderInput = GraphQL::InputObjectType.define do 
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderEmailInput 
  end 

  argument :name, !types.String
  argument :authProvider, !AuthProviderInput 

  # 定义返回的类型
  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password]
    )
  end
end 
