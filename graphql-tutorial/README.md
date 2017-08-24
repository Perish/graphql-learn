
* 定义类型以及相应的查询和变动。
* 用 resolvers 处理这些类型和字段。
* 随着新要求到达，返回步骤1更新模式并继续执行其他步骤。

### type 定义

GraphQL::ObjectType.define {}

### resolver 解析器

你定义了type，但是服务器不知道怎么处理它，所以要有解析器。
解析器就是函数，GraphQL服务器用来为特殊的查询返回数据。每一个type
都需要相应的解析函数。

当查询到达后端，服务器会调用他们的解析函数返回查询指定的字段。

前面执行 rails g graphql:install 的时候创建了一个root 查询类型在目录：
app/graphql/types/query_type.rb

解析器会接受三个参数obj，arg，ctx

