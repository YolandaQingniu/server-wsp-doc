### 秤用户

#### 申请密钥

请求地址: POST /api/v1/scale_users/apply_key

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac|
|user_id|String|Y|用户ID|

返回参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|key|String|Y|密钥|

参数示例:

```json
{
  "mac": "12:34:56:78:9A:BC",
  "user_id": 100
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
    "key": 7181 // 用户key
  }
}
```

#### 创建秤用户

请求地址: POST /api/v1/scale_users/create_scale_user

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac地址|
|user_id|String|Y|用户ID|
|index|Integer|Y|索引|
|key|Integer|Y|密钥|

返回参数:
无

参数示例:

```json
{
  "mac": "F7:53:C8:C5:2B:86",
  "user_id": 200,
  "index": 7,
  "key": 200
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
  }
}
```

#### 删除秤用户

请求地址: POST /api/v1/scale_users/delete_scale_user

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac地址|
|scale_user_ids|String|Y|秤端用户ID, 逗号分割|

返回参数:
无

参数示例:

```json
{
  "mac": "12:34:56:78:9A:BC",
  "scale_user_ids": "100,100"
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
  }
}
```

#### 获取需要删除的秤用户列表

请求地址: GET /api/v1/scale_users/list_need_delete_user

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac地址|

返回参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|scale_users|Array|Y|秤端用户数组|

参数示例:

```json
{
  "mac": "12:34:56:78:9A:BC"
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
    "scale_users": [
      {
        "scale_user_id": "200", // 秤端用户ID
        "user_id": "200", // 用户ID
        "mac": "12:34:56:78:9A:BC", // Mac
        "index": 2, // 用户索引
        "key": 9999 // 用户key
      }
    ]
  }
}
```

#### 获取秤用户列表

请求地址: GET /api/v1/scale_users/list_scale_user

请求参数: 无

返回参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|scale_users|Array|Y|秤端用户数组|

参数示例: 无

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
    "scale_users": [
      {
        "scale_user_id": "200", // 秤端用户ID
        "user_id": "200", // 用户ID
        "mac": "12:34:56:78:9A:BC", // Mac
        "index": 2, // 用户索引
        "key": 9999 // 用户key
      },
      {
        "scale_user_id": "100",
        "user_id": "100",
        "mac": "12:34:56:78:9A:BC",
        "index": 1,
        "key": 1000
      }
    ]
  }
}
```

### WSP秤

#### 申请配网信息

请求地址: POST /api/v1/scales/apply_network_info

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac地址|
|scale_name|String|Y|蓝牙名|
|internal_model|String|Y|内部型号

返回参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|server_url|String|Y|服务器地址|
|ota_url|String|Y|Ota地址|
|secret_key|String|Y|秤端密钥|

参数示例:

```json
{
  "mac": "F7:53:C8:C5:2B:86",
  "scale_name": "QN-Scale",
  "internal_model": "0152"
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
    "server_url": "http://wsp.yolanda.hk:80/wifi_api/wsps?code=", // 服务器地址
    "ota_url": "https://otaurl.yolanda.hk", // Ota升级地址
    "secret_key": "OQnuVdVk8zH5vTmb" // 秘钥
  }
}
```

#### 检查固件版本

请求地址: GET /api/v1/scales/check_firmware_version

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac地址|
|internal_model|String|Y|内部型号|
|hardware_model|Integer|Y|硬件型号|
|current_firmware_version|Integer|Y|当前Ota版本|

返回参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|new_firmware_version_flag|Integer|Y|是否有新的固件版本|

参数示例:

```json
{
  "mac": "12:34:56:78:9A:BC",
  "internal_model": "0001",
  "hardware_model": 2,
  "current_firmware_version": 2
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
    "new_firmware_version_flag": 1 // 是否有新的固件版本 1 有 0 无
  }
}
```

#### 更新加密密钥

请求地址: POST /api/v1/scales/update_secret_key

请求参数:

|字段|类型|是否必填|备注|
|-|-|-|-|
|mac|String|Y|Mac地址|
|secret_key|String|Y|加密密钥|

返回参数:
无

参数示例:

```json
{
  "mac": "12:34:56:78:9A:BC",
  "secret_key": "ti3FaD4bKcP3lQI2"
}
```

返回值示例:

```json
{
  "code": "200",
  "msg": "ok",
  "data": {
  }
}
```
