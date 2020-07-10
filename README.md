### Yuanmag说明

- Yuanmag是人事管理系统加餐馆自助点餐系统（包含服务端、小程序端与后台管理）
基于Spring Boot和Vue.js的Web系统，
以及基于微信小程序构建的前端点餐。

- 目录说明
	1.server目录下主要文件
	
	- api --- 基于Spring Boot搭建的后台api服务
	- core基础模块，包括工具类，dao，service，bean等内容
	- generator代码生成模块，配合IDEA代码生成插件webflash-generator使用效果更好
	2. client下的flash-vue-admin----基于vuejs的后台管理系统
	3. client下的miniprogram-test-1------微信小程序书写的自主点餐界面
	
- 技术选型
	- 核心框架：Spring Boot
	- 权限管理:   Shiro
	- 数据库层：spring data jpa
	- 数据库连接池：druid
	- 缓存：Ehcache
	- 前端：基于Vue.js的管理界面和微信小程序

- 启动步骤

	1.后台服务器
	
	- 引入idea或eclipse
	
	- 创建数据库：web-flash
	- 导入数据库文件
	
	- 确保开发工具下载了lombok插件
	
	- 根据你们自己的配置导入数据库，更改配置文件中的url，账户和密码，配置好自己的maven
	
	- 修改api中数据库连接配置
	
	- 启动api下的application.java主类，访问http://  localhost:8082/swagger-ui.html，保证api服务启动成功

	2.管理系统
	
	- 进入flash-vue-admin目录
	- 此项目使用了node-sass对应的node版本为v12.18.1npm版本为6.14.5
	- 运行npm install --registry = https://registry.npm.taobao.org
	- 运行npm run dev
	- 启动成功后访问http://localhost:9528，
	- 登录，用户名密码：admin / admin
	- 完成管理系统启动
	
	3.点餐界面
	
	
	- 微信开发者工具打开miniprogram-test-1运行即可完成小程序端启动

