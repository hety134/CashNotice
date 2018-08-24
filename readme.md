## 工资邮件通知管理系统

 基于`Laravel 5.5`开发的后台管理系统，使用nginx ＋ php-fpm配置，自带后台模板AdminLTE，简单方便安装即用
 
 Requirements
 ------------
  - PHP >= 7.0.0
  - Laravel >= 5.5.0
  - Fileinfo PHP Extension

## 安装
 ------------
1. git clone +项目地址
2. 引入composer第三方扩展包 composer install
3. cp .env.example .env
4. php artisan key:generate
5. 修改项目中.env文件相应的数据库连接、邮件配置，阿里云服务器不支持25端口，可能会有问题
6.将doc文件夹根下cashNotice.sql导入到数据库
7. php artisan serve开启项目
8. 采用beanstalkd队列（建议配合supervisor使用效果最佳）

```
// 发送邮件通知队列
SendEmail

监听命令: php artisan queue:work beanstalkd --queue=SendEmail --sleep=1 --tries=3 --daemon

```
#### Nginx (nginx.conf已有示例)

```
server {
  listen ****;
  server_name  domain.com;
  root   document_root;
  index  index.php index.html index.htm;
 
  location / {
      try_files $uri $uri/ /index.php?$query_string;
  }

}
```
### 后台访问地址
后台访问地址:域名+/admin
### 用户名/密码
admin / admin

## 操作指南
```
 1.修改密码，在右上角点击名称-设置，进行初始密码修改
 
 2.员工添加：管理员-员工管理
 
 2.1 单个添加，输入姓名邮箱即可
 
 2.2 批量导入，上传excel文件，格式参照下方
 

| 姓名     | 邮箱        |
| ------  | ------      | 
| 马晓腾   | 10001@qq.com|


3.工资文件导入：管理员-工资邮件发送，按照要求上传excel文件，默认处理完成，自动删除上传文件


| 序号    | 姓名  |
| ------  | -----| 
| 8月     | 张三 |

4.上传文件管理：为上传的文件目录，可进行删除


```
### 使用依赖
- [encore/laravel-admin]
- [guzzlehttp/guzzle]
- [laravelcollective/html]
- [maatwebsite/excel]
- [pda/pheanstalk]
- [spatie/laravel-permission]
- [laravel-admin-ext/media-manager]