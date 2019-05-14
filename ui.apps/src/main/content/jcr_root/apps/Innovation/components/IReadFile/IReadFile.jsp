<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%@page import="java.io.BufferedReader,java.io.FileReader,java.io.IOException"%>
<%
	BufferedReader br = null;
	String ipath = (String) properties.get("ifupload");

    if(ipath != null){%><%=ipath%><br/><%
        try{
        %>I am inside reading file -1<br/><%
            String sCurrentLine;
         %>I am inside reading file -2<br/><%
            br= new BufferedReader(new FileReader(ipath));
         %>I am inside reading file -3<br/><%
            while ((sCurrentLine = br.readLine()) != null) {
              %>I am inside reading file -4<br/><%
                    %><%=sCurrentLine%><%
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
			try {
					if (br != null)br.close();
			} 
            catch (IOException ex) {
					ex.printStackTrace();
			}
		}
    }else{%><span style="color:red">Please Select the file to read ....</span><%}
%>
