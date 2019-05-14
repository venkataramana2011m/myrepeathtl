package com.test.demobundle;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.osgi.service.component.ComponentContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.workflow.WorkflowException;
import com.day.cq.workflow.WorkflowSession;
import com.day.cq.workflow.exec.WorkItem;
import com.day.cq.workflow.exec.WorkflowProcess;
import com.day.cq.workflow.metadata.MetaDataMap;

@Component(name = "com.test.demoBundle.test", metatype=false, immediate=true)
@Service(value=TestBundle1.class)
@Properties({
@Property(name="process.label",value="Registartion Bundle"),
@Property(name="service.description",value="This is a test Service."),
@Property(name="service.vendor",value="adobe")
})
public class TestBundle1 implements WorkflowProcess{
    
    private Logger log = LoggerFactory.getLogger(TestBundle1.class);
    public void acivate(ComponentContext context){
        log.info("Bundle Started");
    }
    public void execute(WorkItem arg0, WorkflowSession arg1, MetaDataMap arg2)
            throws WorkflowException {
        // TODO Auto-generated method stub
    	 log.info("Inside Execute");
    }

}
