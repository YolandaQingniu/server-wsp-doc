class ScaleUser < Granite::Base
  connection mysql
  table scale_users
  column scale_user_id : Int64, primary: true
  column user_id : Int64         # 用户ID
  column primary_user_id : Int64 # 主用户ID
  column mac : String            # Mac地址
  column user_index : Int32      # 用户索引
  column user_key : Int32        # 用户密钥
  column deleted_at : Time?      # 假删除时间
  column scale_id : Int64        # 秤端ID
end
