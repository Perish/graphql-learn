class Resolvers::SignInUser < GraphQL::Function
  # 接收参数
  argument :email, !Types::AuthProviderEmailInput

  # 定义返回的值
  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end 

  # 解析函数
  def call(_obj, args, _ctx)
    input = args[:email]

    return unless input

    user = User.find_by email: input[:email]

    return unless user
    return unless user.authenticate(input[:password])

    # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")
    _ctx[:session][:token] = token 
    
    OpenStruct.new({
      user: user,
      token: token
    })
  end 
end 
