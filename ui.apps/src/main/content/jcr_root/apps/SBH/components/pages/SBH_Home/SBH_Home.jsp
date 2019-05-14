<%@include file="/libs/foundation/global.jsp"%>

<html>
    <cq:include script="header.jsp"/>
    
    <body>
        <table style="width:100%; height:50px;">
        
        <tr>  
                     <td colspan="2" style="width:100%; height:15px;"> 
                             
                     </td>  
                 </tr>                
                 <tr>  
                      <td>
                          
                      </td>
                      <td style="vertical-align:top; width:220px; height:430px">
                      <br/>
                               <table style="width:100%">
                                    <tr>
                                        <td colspan="3"><cq:include path="imagepar" resourceType="foundation/components/parsys"/></td>
                                    </tr>
                                    <tr>
                                        <c:forEach var="i" begin="1" end="3"> 
                                            <td style="width:33%;height: vertical-align:top;"> 
                                               <cq:include path="par${i}" resourceType="foundation/components/parsys"/>
                                            </td>
                                        </c:forEach>
                                    
                                    </tr>
                                    <tr>
                                        <c:forEach var="i" begin="4" end="6">         
                                           <td style="width:33%; vertical-align:top;"> 
                                               <cq:include path="par${i}" resourceType="foundation/components/parsys"/>
                                            </td>
                                        </c:forEach>
                                    </tr>
                                </table>

                     </td>  
                 </tr>
                 <tr>  
                        <td colspan="2">  
                        </td>  
                 </tr>
         </table>
         <cq:include script="footer.jsp"/>
    </body>
</html>
          