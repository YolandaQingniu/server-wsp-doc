post "/wsp/read_scale_users" do |env|
  mac = env.params.json["mac"].as(String)
  scale_users = ScaleUser.where(mac: mac)
  result = scale_users.map do |scale_user|
    user = User.find!(scale_user.user_id)
    {
      user_index: scale_user.user_index,
      gender:     user.gender,
      height:     user.height.to_f,
      birthday:   user.birthday,
      user_key:   scale_user.user_key,
    }
  end
  env.response.print({scale_users: result}.to_json)
end
