class User < Granite::Base
  connection mysql
  table users
  column user_id : Int64, primary: true
  column height : Float64 # 身高
  column gender : Int32   # 性别
  column birthday : Time  # 生日
end
