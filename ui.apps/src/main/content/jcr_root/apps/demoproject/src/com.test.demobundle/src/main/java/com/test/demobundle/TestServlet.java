package com.test.demobundle;

import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;
import javax.jcr.Value;
import javax.jcr.ValueFactory;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.jackrabbit.api.security.user.Authorizable;
import org.apache.jackrabbit.api.security.user.User;
import org.apache.jackrabbit.api.JackrabbitSession;
import org.apache.jackrabbit.api.security.user.UserManager;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.jcr.api.SlingRepository;
import org.osgi.service.component.ComponentContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.security.AuthorizableExistsException;

@Component(name = "com.test.demoBundle", metatype=true, immediate=true)
@Service
@Properties({
@Property(name="sling.servlet.paths",value="/bin/demoservlet"),
@Property(name="sling.servlet.methods",value={"POST"}),
@Property(name="sling.servlet.extensions",value="json")
})
public class TestServlet extends SlingAllMethodsServlet
{
@Reference
SlingRepository repository;

private Logger log = LoggerFactory.getLogger(TestServlet.class);
private Session sess;
private User usr = null;
private String userPath = null; 
private boolean required = false;

public void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response)    {
log.debug("Entered Log");
try    {
	log.debug("Entered Servlet");
	
	String user = request.getParameter("user");
	String pass = request.getParameter("password");
	String repass = request.getParameter("repass");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	log.debug("user :: "+user+" "+"Pass :: "+pass+" " + "rePass :: " +repass +" "+"fname :"+fname+" "+"lname :"+lname+" "+"Email :"+email);
	
	if(fname != null && lname != null){
		required = true;
	}
	
	sess = repository.loginAdministrative("crx.default");
	JackrabbitSession jackSess = (JackrabbitSession) sess;
	UserManager umanager = jackSess.getUserManager();
	if(user == null || pass == null || repass == null)	{
		log.debug("Parameters are nulls.");
		return;
	}
	if(!pass.equals(repass))	{
		log.debug("Passwords entered doesn't match.");
	}
	/*Authorizable auth = (Authorizable) umanager.getAuthorizable(sess.getUserID());
	if(auth instanceof User){
		usr = (User)auth;
		userPath = usr.getPath();
	}
	Node userNode = sess.getNode(userPath);
	if(userNode.hasNode("inbox"))	{
		
	} */
	usr = umanager.createUser(user,pass);
	if(usr != null)	{
		if(required)	{
			//Authorizable autho = umanager.getAuthorizable(userCreated.getID());
			userPath = usr.getPath().toString();
			log.info("UserPath :: "+userPath);
			Node userNode = sess.getNode(userPath);
			if(userNode.hasNode("profile"))	{
				 Node profileNode = sess.getNode(userPath+"/profile");
				 profileNode.setProperty("firstName",fname);
				 profileNode.setProperty("lastName",lname);
				 profileNode.setProperty("email",email);
				 //userCreated.setProperty("firstName",fname);
			} else	{
				Node profileNode = userNode.addNode("profile","nt:unstructured");
				profileNode.setProperty("firstName",fname);
				profileNode.setProperty("lastName",lname);
				profileNode.setProperty("email",email);
			}
		}
	}
	//log.info("UserPath is: "+userPath);
	sess.save();
}
catch(Exception ex){
log.debug("Exception Occured :: ",ex);
}
}

protected void activate(ComponentContext componentContext) {
	log.debug("Entered Acivate Bundle");
}
protected void deactivate(ComponentContext componentContext) {
	// TODO Auto-generated method stub

}
}