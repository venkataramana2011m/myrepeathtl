/**
 * 
 */
package com.communities.aem.core.services;


import com.communities.aem.core.beanutils.Useradminbean;
import com.communities.aem.core.constants.MyToolConstants;

import org.apache.commons.lang.StringUtils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Service;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.handler.Handler;


/**
 * @author pavan.kumar.manda
 *
 */
public class Useradminservice {
	 Useradminbean uab = new Useradminbean();	 
     public void getUserdetails(){   	
    	 //Employee ID
    	 if(uab.getEmplid() == null){
    		 uab.setEmplid("1122000");
    	 }else{
    		 if(uab.getEmplid().matches(MyToolConstants.MYEMPCODE_REGEX)){
    			 uab.getEmplid();
    		 }    		 
    	 }
    	//Employee Name
    	 if(uab.getUserName() == null){
    		 uab.setUserName("Test");
    	 }else{
    		 if(uab.getUserName().matches(MyToolConstants.MYNAME_REGEX)){
    			 uab.getUserName();
    		 }    		 
    	 }
     }
	

}
