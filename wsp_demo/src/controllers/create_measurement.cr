# 创建测量数据
post "/wsp/create_measurement" do |env|
  env.response.content_type = "application/json"
  device_bind = DeviceBind.find_by!(mac: env.params.json["mac"].as(String))
  scale_user = ScaleUser.find_by(
    mac: env.params.json["mac"].as(String),
    user_index: env.params.json["user_index"].as(Int64).to_i
  )
  if scale_user.nil? # 若秤端用户为空, 则返回失败信息
    env.response.print({is_success: false}.to_json)
    halt(env)
  end
  user = User.find!(scale_user.user_id)
  measurement = Measurement.new
  measurement_attributes = {
    timestamp:       env.params.json["timestamp"].as(Int64),
    mac:             env.params.json["mac"].as(String),
    internal_model:  device_bind.internal_model,
    scale_name:      device_bind.scale_name,
    parameter:       device_bind.parameter,
    resistance:      env.params.json["resistance"].as(Int64).to_i,
    sec_resistance:  env.params.json["sec_resistance"].as(Int64).to_i,
    weight:          env.params.json["weight"].as(Float64),
    bmi:             env.params.json["bmi"].as(Float64),
    bodyfat:         env.params.json["bodyfat"].as(Float64),
    body_shape:      env.params.json["body_shape"].as(Int64).to_i,
    fat_free_weight: env.params.json["fat_free_weight"].as(Float64),
    subfat:          env.params.json["subfat"].as(Float64),
    visfat:          env.params.json["visfat"].as(Int64).to_i,
    water:           env.params.json["water"].as(Float64),
    muscle:          env.params.json["muscle"].as(Float64),
    sinew:           env.params.json["sinew"].as(Float64),
    bone:            env.params.json["bone"].as(Float64),
    protein:         env.params.json["protein"].as(Float64),
    bmr:             env.params.json["bmr"].as(Int64).to_i,
    bodyage:         env.params.json["bodyage"].as(Int64).to_i,
    score:           env.params.json["score"].as(Float64),
    heart_rate:      env.params.json["heart_rate"].as(Int64).to_i,
    cardiac_index:   env.params.json["cardiac_index"].as(Float64),
    hmac:            env.params.json["hmac"].as(String),
    user_id:         user.user_id,
    height:          user.height,
    gender:          user.gender,
    birthday:        user.birthday,
  }
  measurement = Measurement.create(**measurement_attributes) # 创建测量数据
  if !measurement.errors[0]?                                      # 创建成功
    # KnownPushWorker.send(measurement, scale_user.primary_user_id) # 发送通知
    env.response.print({is_success: true}.to_json)
  else
    env.response.print({is_success: false}.to_json)
  end
end
