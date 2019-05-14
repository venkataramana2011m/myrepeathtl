import java.util.ArrayList;
import java.net.*;
import javax.mail.internet.InternetAddress;

import org.apache.commons.mail.HtmlEmail;

import com.day.cq.workflow.WorkflowException;
import com.day.cq.workflow.WorkflowSession;
import com.day.cq.workflow.exec.WorkItem;
import com.day.cq.workflow.exec.WorkflowData;
import com.day.cq.workflow.exec.WorkflowProcess;
import com.day.cq.workflow.metadata.MetaDataMap;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.osgi.framework.Constants;
import javax.jcr.Node;
import javax.jcr.RepositoryException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.mailer.MessageGateway;
import com.day.cq.mailer.MessageGatewayService;



/**
 * @scr.component metatype="false" immediate="true"
 * @scr.service interface="com.day.cq.workflow.exec.WorkflowProcess"
 *
 * @scr.property name="service.description" value=
 *               "This is the workflow step for sending email notification"
 * @scr.property name="service.vendor" value="MyApp"
 * @scr.property name="process.label"
 *               value="MyApp Send Email Notification"
 */



@Component
@Service
@Properties({
            @Property(name = service.description, value = "This is the workflow step for sending email notification"),
            @Property(name = service.vendor, value = "MyApp"),
            @Property(name = "process.label", value = "MyApp Send Email Notification")
            })
public class Mailing implements WorkflowProcess {

    private static final Logger log = LoggerFactory
            .getLogger(Mailing.class);

     ArrayList<InternetAddress> emailRecipients = new ArrayList<InternetAddress>();

    // ----< public configuration values >--------------------------------------

    /** @scr.reference policy="dynamic" */
    private MessageGateway<HtmlEmail> messageGateway;

    /** @scr.reference policy="static" */
    private MessageGatewayService messageGatewayService;

    public void execute(WorkItem item, WorkflowSession session,
            MetaDataMap metaData) throws WorkflowException {

        HtmlEmail email = new HtmlEmail();

         try{
              emailRecipients.add(new InternetAddress("venky06576@gmail.com") );
              email.setTo( emailRecipients );
              email.setSubject( "This is subject");
              email.setHtmlMsg( "Email testing is on..");

              //Check the logs to see that messageGatewayService is not null
              log.info("messageGatewayService : " + messageGatewayService);

              messageGateway = messageGatewayService.getGateway(HtmlEmail.class);

              //Check the logs to see that messageGateway is not null
              log.info("messageGateway : " + messageGateway);

              messageGateway.send( email );
             }
          catch ( Exception e ) {
              e.printStackTrace();
              log.error( "Fatal error while sending email in workflow", e );
          }

     }  

    }