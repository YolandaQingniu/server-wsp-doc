post "/wsp/read_secret_key" do |env|
  mac = env.params.json["mac"].as(String)
  scale = Scale.find_by(mac: mac)
  secret_key = scale.nil? ? "" : scale.secret_key
  env.response.print({secret_key: secret_key}.to_json)
end
