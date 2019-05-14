package com.test.registrationwf;
import java.util.Dictionary;

import javax.jcr.Session;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.osgi.service.component.ComponentContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.day.cq.commons.jcr.JcrConstants;
import com.day.cq.workflow.WorkflowException;
import com.day.cq.workflow.WorkflowSession;
import com.day.cq.workflow.exec.WorkItem;
import com.day.cq.workflow.exec.WorkflowData;
import com.day.cq.workflow.exec.WorkflowProcess;
import com.day.cq.workflow.metadata.MetaDataMap;
//import com.test.registration.Registration;

@Component(name = "com.test.registrationwf", metatype=true, immediate=true)
@Service
@Properties({
	@Property(name="process.label",value="Registration WF"),
	@Property(name="service.description",value="Registration Service"),
	@Property(name="service.vendor",value="Adobe")
})
public class RegistrationWF implements WorkflowProcess {
private Logger log = LoggerFactory.getLogger(RegistrationWF.class);
	
	public void execute(WorkItem item, WorkflowSession wfsession, MetaDataMap map)
			throws WorkflowException {
		try{
		log.info("Inside Execute Method");
		WorkflowData wfdata = item.getWorkflowData();
		log.info(wfdata.getPayload().toString());
		/*if(wfdata.getPayloadType().toString().equals(JcrConstants.JCR_PATH))	{
			String payload = wfdata.getPayload().toString();
			log.info("Payload Path: "+payload);
			Session jcrSession = wfsession.getSession();
		} else {
			log.info("Else");
		}*/
		}
		catch(Exception ex)	{
			//log.debug("Exception Occured",ex);
		}
	}
	protected void activate(ComponentContext context){
		log.info("Inside Activate Method");
	}

}
