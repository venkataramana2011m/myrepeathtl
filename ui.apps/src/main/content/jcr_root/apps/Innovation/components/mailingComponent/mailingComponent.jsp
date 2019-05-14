<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" 
        contentType="text/html;charset=UTF-8"
		import="org.apache.sling.api.request.ResponseUtil"%>
<html ng-app="contact_Form">
  <head>
    <title></title>
        <style>			
            .ng-invalid.ng-dirty {
                border-color: #FA787E;
            }

            .ng-valid.ng-dirty {
                border-color: #78FA89;
            }
            fieldset { border:1px solid green; width:600px; }

            legend {
              padding: 0.2em 0.5em;
              border:1px solid green;
              color:black;
              background-color:yellow;
              font-weight:bold;
              font-size:90%;
              text-align:left;
              }
         </style>
      <cq:includeClientLib js="angularjs"/>
      <cq:includeClientLib js="dist"/>
      <cq:includeClientLib css="dist"/>
      <cq:includeClientLib js="etcdesigns.mailingComponent.base" />
		<script>
			function myFunction(boolvalues,trgtid) {
				alert(document.getElementById(trgtid).readOnly);
                if(boolvalues){
				   document.getElementById(trgtid).readOnly = true;
			   }
			   else{
					 document.getElementById(trgtid).readOnly = false;
			   }

			}
		</script>
  </head>

  <body>

       <%  
    		String from =  properties.get("from","");; 
            String to =  properties.get("to","");;
			String msgbody = properties.get("msgbody","");
			boolean isFrmChecked = properties.get("togglefrom",false);
			boolean isToChecked = properties.get("toggleto",false);
		%>

      <span>you have entered From address as : <%=from%></span><br/>
            you have entered To   address as : <%=to%><br/>
            you have entered Message as : <%=msgbody%><br/>
      		you have entered Message as : <%=isFrmChecked%><br/>
      		you have entered Message as : <%=isToChecked%><br/>

	  <script>
            myFunction('<%=isFrmChecked%>','txtfrom');
			myFunction('<%=isToChecked%>','txtto');
      </script>

			<form name="contactForm" ng-controller="ContactController as contactCtrl" ng-submit="contactForm.$valid && contactCtrl.addContact(contactfrm)" novalidate>

               			<div>
				<fieldset>
					<legend> Contact Us </legend>
                    <table cellspacing="0" cellpadding="0">
                            <tr>
                                <td>Enter The From Email - Id: </td>
                                <td><input name="txtfrom" id="txtfrom" ng-model="contactCtrl.contacts.from" value="<%=from%>" type="email" required  /></td>
                            </tr>
                            <tr>
                                <td>Enter The To Email - Id: </td>
                                <td><input name="to" id="txtto" ng-model="contactCtrl.contacts.to" value="<%=to%>" type="email" required  /></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: text-top;">Enter The Message: </td>
                                <td><textarea rows="4" cols="50" name="body" ng-model="contactCtrl.contacts.body" required></textarea></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="float: right;">
                                    <div style="width:100%; float: right;"><input  type="submit" value="Submit"/> </div>  
                                </td>
                            </tr>
                        </table>
				</fieldset>
			</div>

			</form>

  </body>
</html>