package cn.tf.ecps.utils;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

public class OrderFlowListener  implements  TaskListener {

	
	public void notify(DelegateTask delegateTask) {
		//获得任务的定义id
		String taskKey=delegateTask.getTaskDefinitionKey();
		delegateTask.setAssignee(taskKey+"er");
		
		
	}
	
	

}
