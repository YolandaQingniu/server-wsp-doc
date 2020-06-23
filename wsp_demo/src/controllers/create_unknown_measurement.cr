post "/wsp/create_unknown_measurement" do |env|
  device_bind = DeviceBind.find_by!(mac: env.params.json["mac"].as(String))
  scale_users = ScaleUser.where(mac: env.params.json["mac"].as(String)) # 获取秤端用户
  unknown_user_ids = [] of Int64                                        # 待分配用户ID
  scale_users.each { |x| unknown_user_ids << x.primary_user_id }        # 转化为主用户ID
  unknown_user_ids = unknown_user_ids.uniq.join(";")
  unknown_measurement_attributes = {
    weight:         env.params.json["weight"].as(Float64),
    mac:            env.params.json["mac"].as(String),
    scale_name:     device_bind.scale_name,
    internal_model: device_bind.internal_model,
    timestamp:      env.params.json["timestamp"].as(Int64),
    heart_rate:     env.params.json["heart_rate"].as(Int64).to_i,
    resistance:     env.params.json["resistance"].as(Int64).to_i,
    sec_resistance: env.params.json["sec_resistance"].as(Int64).to_i,
    hmac:           env.params.json["hmac"].as(String),
    unknown_user:   unknown_user_ids,
  }
  unknown_measurement = UnknownMeasurement.create(**unknown_measurement_attributes) # 创建未知测量数据
  if !unknown_measurement.errors[0]?                                                     # 创建成功
    # UnknownPushWorker.send(unknown_measurement, unknown_user_ids)                   # 发送通知
    env.response.print({is_success: true}.to_json)
  else
    env.response.print({is_success: false}.to_json)
  end
end
