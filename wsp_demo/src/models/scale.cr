class Scale < Granite::Base
  connection mysql
  table scales
  column scale_id : Int64, primary: true
  column mac : String            # mac地址
  column scale_name : String     # 蓝牙名
  column internal_model : String # 内部型号
  column last_sync_at : Time?    # 最后同步时间
  column secret_key : String     # 秤端密钥
end
