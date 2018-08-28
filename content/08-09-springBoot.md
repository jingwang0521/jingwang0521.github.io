## SpringBoot

### 一、依赖
```
<!-可执行jar包--->
< build>
    <plugins> 
        <plugin> 
            <groupId> org.springframework.boot </ groupId> 
            <artifactId> spring-boot-maven-plugin </ artifactId> 
        </ plugin> 
    </ plugins> 
</ build>


<!-热部署--->
<dependencies> 
    <dependency> 
        <groupId> org.springframework.boot </ groupId> 
        <artifactId> spring-boot-devtools </ artifactId> 
        <optional> true </ optional> 
    </ dependency> 
</ dependencies>

不想使用重启功能，可以使用该spring.devtools.restart.enabled属性将其禁用。
可以在设置中进行此设置 application.properties

```

### 二、随机数
```
# 随机字符串
com.didispace.blog.value=${random.value}
# 随机int
com.didispace.blog.number=${random.int}
# 随机long
com.didispace.blog.bignumber=${random.long}
# 10以内的随机数
com.didispace.blog.test1=${random.int(10)}
# 10-20的随机数
com.didispace.blog.test2=${random.int[10,20]}


```


### 三、tip


```
通过 @ConfigurationProperties(prefix = "home”) 注解，
将配置文件中以 home 前缀的属性值自动绑定到对应的字段中。
同是用 @Component 作为 Bean 注入到 Spring 容器中。


```


### 四、服务端口配置
```
server.port=8080

```


### 五、多环境的配置
```
application.properties里面写使用的配置
		spring.profiles.active=uat



application-dev.properties//开发
application-uat.properties//测试
application-pro.properties//生产

```


### 六、数据库配置
```

## mysql数据库配置
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/simple?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=utf8&autoReconnect=true&rewriteBatchedStatements=TRUE&useSSL=false&allowMultiQueries=true
spring.datasource.username=root
spring.datasource.password=1234


spring.datasource.initialSize=5
spring.datasource.minIdle=5
spring.datasource.maxActive=20
spring.datasource.maxWait=60000
spring.datasource.timeBetweenEvictionRunsMillis=60000
spring.datasource.minEvictableIdleTimeMillis =300000
spring.datasource.validationQuery =select 'x'
spring.datasource.testWhileIdle=true
spring.datasource.testOnBorrow=false
spring.datasource.testOnReturn=false
spring.datasource.poolPreparedStatements =true
spring.datasource.maxPoolPreparedStatementPerConnectionSize=20
spring.datasource.filters=stat,log4j
spring.datasource.connectionProperties=druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000


```

### 七、以及mybatis映射
```
mybatis.type-aliases-package=com.hand.springboot1.domain.entity
mybatis.mapper-locations=classpath:com.hand.springboot1.infra.mapper/*.xml


```

### 八、Spring Boot 之 annotation注解 

1.	基于类的注解:
```
		1.1 初始装载
		@SpringBootApplication        spring-boot程序入口标志类
		@Configuration               自动配置，类似于加载spring加载xml,类可以使用@Bean并且启动的时候会初始化bean
		@EnableAutoConfiguration     Spring-Boot 根据应用所声明的依赖来对Spring框架进行自动配置
		@ComponentScan               规定扫描包的范围
		@PropertySources             property扫描加载

		1.2 业务区分
		@Component 定义该bean为一个普通组件
		@Repository  定义该bean是一个仓储，用于数据库、mq、redis以及其它一些远程访问的资源
		@Service      定义该bean是一个业务逻辑
		@Controller  定义该bean是一个控制页面访问层

		1.3 加载条件
		@Order               		 配置加载顺序
		@ConditionalOnClass 		 该注解的参数对应的类必须存在，否则不解析该注解修饰的配置类；
		@ConditionalOnMissingBean  该注解表示，如果存在它修饰的类的bean，则不需要再创建这个bean；
		可以给该注解传入参数例如@ConditionOnMissingBean(name = "example")，
		这个表示如果name为“example”的bean存在，这该注解修饰的代码块不执行。
		@AutoConfigureAfter 	在自动装载类之后装载
```

2.	基于属性的注解:

```
		@Value         加载配置属性的值
		@Autowired  自动注入bean
		@Qualifier    当存在多个bean注入时，如接口的不同实现，需要通过name进行过滤
		@Resource   获取当前jvm的resource 也类似依赖注入
		@Inject       字段注入bean

```

3.	基于方法的注解:

```
		@Bean               发布一个返回object类型的bean，类似配置xml发布一个bean
		@PostConstruct   指定当类加载完成的时候就会执行该方法

```

### 九、Profile

1.	

```
	可以在SpringBoot的配置文件中增加profile的激活项。
	如：spring.profiles.active=dev。

```

2.	
```
	@Profile(value = "prod")
	我们在根据环境进行功能切换的类上加上@Profile注解，这样就可以根据激活的环境，
	注入不同的实现类。注意一下：如果用了@Profile这个注解，在配置项中找不到@Profile中的值的话，
	在系统启动的时候是会报错的。

```

### 十、Undertow
```
	Undertow是Jboss开发的一款基于XNIO的高性能Web服务器，并且兼容servlet3.
	boot中很容易利用starter来替换掉tomcat作为服务容器。


  <!-- 下面的配置将使用undertow来做服务器而不是tomcat -->
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-web</artifactId>
	<exclusions>
		<exclusion>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-tomcat</artifactId>
		</exclusion>
	</exclusions>
</dependency>
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-undertow</artifactId>
</dependency>



    // 在@Configuration的类中添加@bean 
    @Bean 
    UndertowEmbeddedServletContainerFactory embeddedServletContainerFactory() {

	     UndertowEmbeddedServletContainerFactory factory = new 
	     UndertowEmbeddedServletContainerFactory(); // 这里也可以做其他配置 factory.addBuilderCustomizers(builder -> 

	     builder.setServerOption(UndertowOptions.ENABLE_HTTP2, true)); return factory; 
 	}

```

```
	# 设置IO线程数, 它主要执行非阻塞的任务,它们会负责多个连接, 默认设置每个CPU核心一个线程
	 server.undertow.io-threads=4 

	 # 阻塞任务线程池, 当执行类似servlet请求阻塞操作, undertow会从这个线程池中取得线程,它的值设置取决于系统的负载 server.undertow.worker-threads=20 

	 # 以下的配置会影响buffer,这些buffer会用于服务器连接的IO操作,有点类似netty的池化内存管理 
	 # 每块buffer的空间大小,越小的空间被利用越充分 
	 server.undertow.buffer-size=1024 

	 # 每个区分配的buffer数量 , 所以pool的大小是buffer-size * buffers-per-region 
	 server.undertow.buffers-per-region=1024 

	 # 是否分配的直接内存 
	 server.undertow.direct-buffers=true

```

