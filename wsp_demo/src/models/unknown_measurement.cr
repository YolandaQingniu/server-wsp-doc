class UnknownMeasurement < Granite::Base
  connection mysql
  table unknown_measurements
  column unknown_measurement_id : Int64, primary: true
  column weight : Float64        # 体重
  column mac : String            # Mac地址
  column scale_name : String     # 蓝牙名
  column internal_model : String # 内部型号
  column timestamp : Int64       # 测量时间戳
  column heart_rate : Int32      # 心率
  column resistance : Int32      # 50k电阻
  column sec_resistance : Int32  # 500k电阻
  column unknown_user : String   # 待分配主用户
  column hmac : String?          # Hmac
end
