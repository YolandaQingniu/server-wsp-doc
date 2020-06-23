post "/wsp/finish_info_sync" do |env|
  mac = env.params.json["mac"].as(String)
  scale_users = ScaleUser.all("where mac = ? and deleted_at is not null", [mac])
  if scale_users
    scale_users.each do |scale_user|
      scale_user.destroy
    end
  end
  env.response.print({is_success: true}.to_json)
end
