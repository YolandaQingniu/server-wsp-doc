class Measurement < Granite::Base
  connection mysql
  table measurements
  column measurement_id : Int64, primary: true
  column user_id : Int64                 # 用户ID
  column timestamp : Int64               # 时间戳
  column scale_name : String             # 蓝牙名
  column internal_model : String         # 内部型号
  column mac : String                    # Mac
  column height : Float64 = 0.0          # 身高
  column gender : Int32 = 0              # 性别
  column birthday : Time                 # 生日
  column resistance : Int32 = 0          # 50k电阻
  column sec_resistance : Int32 = 0      # 500k电阻
  column score : Float64 = 0.0           # 分数
  column weight : Float64 = 0.0          # 体重
  column bodyfat : Float64 = 0.0         # 体脂率
  column subfat : Float64 = 0.0          # 皮下脂肪
  column visfat : Int32 = 0              # 内脏脂肪等级
  column water : Float64 = 0.0           # 体水分
  column bmr : Int32 = 0                 # 基础代谢
  column bodyage : Int32 = 0             # 体年龄
  column muscle : Float64 = 0.0          # 骨骼肌率
  column bone : Float64 = 0.0            # 骨量(无机盐)
  column bmi : Float64 = 0.0             # BMI
  column sinew : Float64 = 0.0           # 肌肉量
  column protein : Float64 = 0.0         # 蛋白质
  column body_shape : Int32 = 0          # 体型
  column fat_free_weight : Float64 = 0.0 # 去脂脂肪
  column heart_rate : Int32 = 0          # 心率
  column cardiac_index : Float64 = 0.0   # 心脏指数
  column parameter : Int32 = 0           # 指标
  column hmac : String?                  # Hmac
end
