# 介绍

该文档是介绍深圳市伊欧乐科技有限公司（后简称`云康宝`）的WSP双模秤的服务器交互流程，用以指导友商开发秤端的云端接口。

主要包含以下内容

- [server-wsp-flow-chart.pdf](server-wsp-flow-chart.pdf)

- [服务器与Docker接口文档](api.html)

- [服务器与APP接口文档](interface.md)

- [服务器与APP通讯开发指南](transfer.md)

- [demo示例](wsp_demo)

- [Docker容器的Dockerfile和配置文件](wsp_server_1_0_3)

### Docker服务拥有的路径

+ 跳过秤端测试demo是否正常(网页端访问)
  + 接口路径: `GET /yolanda/test`
  + 在线示例: http://wsp-sdk.yolanda.hk/yolanda/test

+ 秤端与docker交互的真实路径
  + 接口路径: `GET /yolanda/wsp?code=`  
  + 在线示例: http://wsp-sdk.yolanda.hk/yolanda/wsp?code=ERROR

+ 健康检查
  + 接口路径: `GET /yolanda/healthcheck`
  + 在线示例: http://wsp-sdk.yolanda.hk/yolanda/healthcheck
