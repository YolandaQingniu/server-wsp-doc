class DeviceBind < Granite::Base
  connection mysql
  table device_binds
  column device_bind_id : Int64, primary: true
  column user_id : Int64         # 用户ID
  column mac : String            # Mac地址
  column internal_model : String # 内部型号
  column scale_name : String     # 蓝牙名
  column model : String          # 型号
  column parameter : Int32       # 指标
end
