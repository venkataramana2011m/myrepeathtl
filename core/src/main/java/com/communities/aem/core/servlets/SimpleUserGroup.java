package com.communities.aem.core.servlets;
 
import java.io.IOException;
import java.security.Principal;
 


import javax.jcr.PropertyType;
import javax.jcr.Session;
import javax.jcr.Value;
import javax.servlet.Servlet;
 


import org.apache.commons.lang.StringUtils;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.jackrabbit.api.security.user.Group;
import org.apache.jackrabbit.api.security.user.User;
import org.apache.jackrabbit.api.security.user.UserManager;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
@Service(value = Servlet.class)
@Component(immediate = true, metatype = true)
@Properties({
  @Property(name = "sling.servlet.paths", value = "/services/SimpleUserGroup"),
  @Property(name = "service.description", value = "SimpleUserGroup"),
  @Property(name = "label", value = "SimpleUserGroup") })
 
public class SimpleUserGroup extends SlingAllMethodsServlet{
  
 /**
  *
  */
 private static final long serialVersionUID = 1L;
 
 @Reference
 ResourceResolverFactory resolverFactory;
  
 @SuppressWarnings("unused")
private static Logger logger = LoggerFactory.getLogger(SimpleUserGroup.class);
  
 @SuppressWarnings("deprecation")
protected final void doPost(final SlingHttpServletRequest request,
   final SlingHttpServletResponse response) throws IOException {
   
   
      
  String groupName= request.getParameter("groupName");
  String userName=request.getParameter("userName");
  String password="sampleUser";
 
  ResourceResolver adminResolver = null;
  Session adminSession=null;
  try {
         adminResolver = resolverFactory.getAdministrativeResourceResolver(null);
         adminSession = adminResolver.adaptTo(Session.class);
         final UserManager userManager= adminResolver.adaptTo(UserManager.class);
                
        if(null==userManager.getAuthorizable(groupName)){
         
         Group group=userManager.createGroup(groupName,new SimplePrincipal(groupName),"/home/groups/test"); 
         
         Value value=adminSession.getValueFactory().createValue("Sample Group", PropertyType.STRING);
         group.setProperty("./profile/givenName", value);
          
         value=adminSession.getValueFactory().createValue("Test Group", PropertyType.STRING);
         group.setProperty("./profile/aboutMe", value);
          
         value=adminSession.getValueFactory().createValue("abc@gmail.com", PropertyType.STRING);
         group.setProperty("./profile/email", value);        
                  
         }else{
         response.getWriter().write("Group already exist..");
         }
        
        if(userManager.getAuthorizable(userName)==null){
         User user=userManager.createUser(userName, password,new SimplePrincipal(userName),"/home/users/test");
         Value value=adminSession.getValueFactory().createValue("Issac", PropertyType.STRING);
         user.setProperty("./profile/familyName", value);
         
         value=adminSession.getValueFactory().createValue("Albin", PropertyType.STRING);
         user.setProperty("./profile/givenName", value);
         
         value=adminSession.getValueFactory().createValue("Test User", PropertyType.STRING);
         user.setProperty("./profile/aboutMe", value);
         
         value=adminSession.getValueFactory().createValue("albin@gmail.com", PropertyType.STRING);
         user.setProperty("./profile/email", value);        
        
         }else
         {
          response.getWriter().write("User already exist.."); 
         }
        
        
        Group group = (Group)(userManager.getAuthorizable(groupName));
        group.addMember(userManager.getAuthorizable(userName));
                          
  } catch (Exception e) {
   e.printStackTrace();
   response.getWriter().write("Not able to perform User Management.."+resolverFactory);
  } finally {
         if (adminResolver != null) 
             adminResolver.close();
          
         response.getWriter().write("AEM User successfully created.."); 
                 
  }
   
 }
  
 protected final void doGet(final SlingHttpServletRequest request,
   final SlingHttpServletResponse response) throws IOException {
  doPost(request, response);
 }
  
  
 private static class SimplePrincipal implements Principal {
        protected final String name;
 
        public SimplePrincipal(String name) {
            if (StringUtils.isBlank(name)) {
                throw new IllegalArgumentException("Principal name cannot be blank.");
            }
            this.name = name;
        }
 
        public String getName() {
            return name;
        }
 
        @Override
        public int hashCode() {
            return name.hashCode();
        }
 
        @Override
        public boolean equals(Object obj) {
            if (obj instanceof Principal) {
                return name.equals(((Principal) obj).getName());
            }
            return false;
        }
    }
 
}