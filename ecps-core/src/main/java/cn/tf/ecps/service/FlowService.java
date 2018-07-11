package cn.tf.ecps.service;

import java.util.List;

import cn.tf.ecps.po.TaskBean;

public interface FlowService {
	
	//部署
	public void deploy();
	//启动流程实例
	public String startFlow(Long orderId);
	//付款
	public void compeleteTaskByPid(String processInstanceId, String string);

	public List<TaskBean>   selectTaskByAssignee(String assignee);
	
	public TaskBean selectTaskBeanByTId(String taskId);
	
	public void completeTaskByTid(String taskId, String outcome);
}
