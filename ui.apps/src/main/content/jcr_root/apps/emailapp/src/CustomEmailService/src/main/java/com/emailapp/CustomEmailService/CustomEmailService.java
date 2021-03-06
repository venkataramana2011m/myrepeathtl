package com.emailapp.CustomEmailService;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class CustomEmailService {

     
    //Specify data members for the EmailServiceImpl
    //These members correspond to configuration values
    protected String m_smtpHost;
    protected String m_smtpUser;
    protected String m_smtpPassword;
 
 
    //Send the email.
    public void send(String aHost,    
                  String ToAddress, 
                    String aSubject, 
                    String aMessage 
                    ) 
    {
         
    try
    {
         
        // Recipient's email ID needs to be mentioned.
        String to = ToAddress;
 
        // Sender's email ID needs to be mentioned
        String from = "<valid sender email address>";
 
        // Get system properties
        Properties properties = System.getProperties();
 
        // Setup mail server (Depending upon your
        // Mail server - you may need more props here
        properties.setProperty("mail.smtp.host", aHost);
        properties.setProperty("mail.smtp.user", "<valid SMTP user>");
 
        // Get the default Session object.
        Session session = Session.getDefaultInstance(properties);
 
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);
 
         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));
 
         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO,
        new InternetAddress(to));
         
       // Set Subject: header field
       message.setSubject(aSubject);
 
      // Now set the actual message
      message.setText(aMessage);
 
      // Send message
      Transport.send(message);
      System.out.println("Sent message successfully....");
         } 
     
catch (Exception ex) 
    {
        ex.printStackTrace();
        }
   }
        
//check If passed in string contains only non whitespace
  public static boolean isEmpty(String aValue) {
       return (aValue == null || aValue.trim().length() == 0);
   }
}