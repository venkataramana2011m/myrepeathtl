package com.SBH;
 
import javax.servlet.ServletException;
 
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;


@Component(metatype = true)
@Service(Servlet.class)
@Properties({
    @Property(name = "sling.servlet.resourceTypes", value = "sling/servlet/default"),
    @Property(name = "sling.servlet.selectors", value = "hello"),
    @Property(name = "sling.servlet.extensions", value = "html"),
    @Property(name = "sling.servlet.methods", value = "GET")
})

public class userAutenticaion extends SlingAllMethodsServlet {
    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException
    {
        //Do something fun here
    }

    @Override
    protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException
    {
        
    }
}