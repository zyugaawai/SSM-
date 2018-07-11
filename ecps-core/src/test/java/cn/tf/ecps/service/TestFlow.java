package cn.tf.ecps.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)//指定juit的spring运行器
@ContextConfiguration(locations={"classpath:beans.xml"})//指定spring的文件
public class TestFlow {
	
	@Autowired
	private FlowService flowService;
	
	@Test
	public  void deployFlow(){
		flowService.deploy();
		
	}
	
	/*org.apache.ibatis.exceptions.PersistenceException: 
		### Error updating database.  Cause: java.sql.SQLException: ORA-01461: 仅能绑定要插入 LONG 列的 LONG 值

		### The error may involve org.activiti.engine.impl.persistence.entity.ResourceEntity.bulkInsertResource_oracle-Inline
		### The error occurred while setting parameters
		### SQL: INSERT ALL                   INTO ACT_GE_BYTEARRAY(ID_, REV_, NAME_, BYTES_, DEPLOYMENT_ID_, GENERATED_) VALUES          (?,          1,          ?,          ?,          ?,          ?)                   INTO ACT_GE_BYTEARRAY(ID_, REV_, NAME_, BYTES_, DEPLOYMENT_ID_, GENERATED_) VALUES          (?,          1,          ?,          ?,          ?,          ?)             SELECT * FROM dual
		### Cause: java.sql.SQLException: ORA-01461: 仅能绑定要插入 LONG 列的 LONG 值

			at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:23)
			at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:150)
			at org.apache.ibatis.session.defaults.DefaultSqlSession.insert(DefaultSqlSession.java:137)
			at org.activiti.engine.impl.db.DbSqlSession.flushBulkInsert(DbSqlSession.java:850)
			at org.activiti.engine.impl.db.DbSqlSession.flushPersistentObjects(DbSqlSession.java:820)
			at org.activiti.engine.impl.db.DbSqlSession.flushInserts(DbSqlSession.java:797)
			at org.activiti.engine.impl.db.DbSqlSession.flush(DbSqlSession.java:618)
			at org.activiti.engine.impl.interceptor.CommandContext.flushSessions(CommandContext.java:212)
			at org.activiti.engine.impl.interceptor.CommandContext.close(CommandContext.java:138)
			at org.activiti.engine.impl.interceptor.CommandContextInterceptor.execute(CommandContextInterceptor.java:66)
			at org.activiti.spring.SpringTransactionInterceptor$1.doInTransaction(SpringTransactionInterceptor.java:47)
			at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:130)
			at org.activiti.spring.SpringTransactionInterceptor.execute(SpringTransactionInterceptor.java:45)
			at org.activiti.engine.impl.interceptor.LogInterceptor.execute(LogInterceptor.java:37)
			at org.activiti.engine.impl.cfg.CommandExecutorImpl.execute(CommandExecutorImpl.java:40)
			at org.activiti.engine.impl.cfg.CommandExecutorImpl.execute(CommandExecutorImpl.java:35)
			at org.activiti.engine.impl.RepositoryServiceImpl.deploy(RepositoryServiceImpl.java:79)
			at org.activiti.engine.impl.repository.DeploymentBuilderImpl.deploy(DeploymentBuilderImpl.java:156)
			at cn.tf.ecps.service.impl.FlowServiceImpl.deploy(FlowServiceImpl.java:32)
			at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
			at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
			at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
			at java.lang.reflect.Method.invoke(Method.java:597)
			at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:309)
			at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:183)
			at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
			at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:110)
			at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
			at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:90)
			at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
			at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:202)
			at com.sun.proxy.$Proxy27.deploy(Unknown Source)
			at cn.tf.ecps.service.TestFlow.deployFlow(TestFlow.java:18)
			at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
			at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
			at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
			at java.lang.reflect.Method.invoke(Method.java:597)
			at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:44)
			at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:15)
			at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:41)
			at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:20)
			at org.junit.internal.runners.statements.RunBefores.evaluate(RunBefores.java:28)
			at org.springframework.test.context.junit4.statements.RunBeforeTestMethodCallbacks.evaluate(RunBeforeTestMethodCallbacks.java:74)
			at org.junit.internal.runners.statements.RunAfters.evaluate(RunAfters.java:31)
			at org.springframework.test.context.junit4.statements.RunAfterTestMethodCallbacks.evaluate(RunAfterTestMethodCallbacks.java:82)
			at org.springframework.test.context.junit4.statements.SpringRepeat.evaluate(SpringRepeat.java:72)
			at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.runChild(SpringJUnit4ClassRunner.java:231)
			at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:46)
			at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:180)
			at org.junit.runners.ParentRunner.access$000(ParentRunner.java:41)
			at org.junit.runners.ParentRunner$1.evaluate(ParentRunner.java:173)
			at org.junit.internal.runners.statements.RunBefores.evaluate(RunBefores.java:28)
			at org.springframework.test.context.junit4.statements.RunBeforeTestClassCallbacks.evaluate(RunBeforeTestClassCallbacks.java:61)
			at org.junit.internal.runners.statements.RunAfters.evaluate(RunAfters.java:31)
			at org.springframework.test.context.junit4.statements.RunAfterTestClassCallbacks.evaluate(RunAfterTestClassCallbacks.java:70)
			at org.junit.runners.ParentRunner.run(ParentRunner.java:220)
			at org.springframework.test.context.junit4.SpringJUnit4ClassRunner.run(SpringJUnit4ClassRunner.java:174)
			at org.eclipse.jdt.internal.junit4.runner.JUnit4TestReference.run(JUnit4TestReference.java:50)
			at org.eclipse.jdt.internal.junit.runner.TestExecution.run(TestExecution.java:38)
			at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.runTests(RemoteTestRunner.java:467)
			at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.runTests(RemoteTestRunner.java:683)
			at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.run(RemoteTestRunner.java:390)
			at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.main(RemoteTestRunner.java:197)
		Caused by: java.sql.SQLException: ORA-01461: 仅能绑定要插入 LONG 列的 LONG 值

			at oracle.jdbc.dbaccess.DBError.throwSqlException(DBError.java:134)
			at oracle.jdbc.ttc7.TTIoer.processError(TTIoer.java:289)
			at oracle.jdbc.ttc7.Oall7.receive(Oall7.java:573)
			at oracle.jdbc.ttc7.TTC7Protocol.doOall7(TTC7Protocol.java:1891)
			at oracle.jdbc.ttc7.TTC7Protocol.parseExecuteFetch(TTC7Protocol.java:1093)
			at oracle.jdbc.driver.OracleStatement.executeNonQuery(OracleStatement.java:2047)
			at oracle.jdbc.driver.OracleStatement.doExecuteOther(OracleStatement.java:1940)
			at oracle.jdbc.driver.OracleStatement.doExecuteWithTimeout(OracleStatement.java:2709)
			at oracle.jdbc.driver.OraclePreparedStatement.executeUpdate(OraclePreparedStatement.java:589)
			at oracle.jdbc.driver.OraclePreparedStatement.execute(OraclePreparedStatement.java:656)
			at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
			at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)
			at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
			at java.lang.reflect.Method.invoke(Method.java:597)
			at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:55)
			at com.sun.proxy.$Proxy25.execute(Unknown Source)
			at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:41)
			at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:66)
			at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:45)
			at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:100)
			at org.apache.ibatis.executor.CachingExecutor.update(CachingExecutor.java:75)
			at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:148)
			... 61 more


*/
}
