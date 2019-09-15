<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
   ps = con.prepareStatement("select id,name from service");
   rs=ps.executeQuery();

try{
      
   String addSkill=request.getParameter("add_skill");
   if (addSkill!=null) {
      String serviceProviderId=(String)session.getAttribute("mobile");
      String cityId=request.getParameter("city_id");

      ps=con.prepareStatement("insert into service_provider_skill(service_provider_id,service_id) values(?,?)");
      ps.setString(1,serviceProviderId);
      ps.setString(2,cityId);

      int result = ps.executeUpdate();
      
      if(result == 1)
      {
         response.sendRedirect("view_skill.jsp");
      }
      else
      {
         out.println("<script>alert('Record Not Add')</script>");
      }
   }
}
catch(Exception ex){}
%>
<!--A Design by W3layouts
   Author: W3layout
   Author URL: http://w3layouts.com
   License: Creative Commons Attribution 3.0 Unported
   License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<head>
   <title>Toys Shop an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>
   <!--meta tags -->
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="keywords" content="Toys Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
   Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
   <%@include file="js_script.jsp"%>
   <!--//meta tags ends here-->
   <%@include file="css.jsp"%>

</head>
<style type="text/css">
   .topdrop{
      padding-top: 100px;
   }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
      
      <div class="topdrop">
  <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Address :<%=session.getAttribute("userType")
            %></h5>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button> -->
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="add_service_skill.jsp" method="post">
                     <div class="fields-grid">
                                                
                              <div class="form-group col-md-6">
                                 <label for="inputState">Service</label>   
                                 <select id="inputState" name="city_id" class="form-control">
                                    <%
                                       while(rs.next())
                                          {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                    <%
                                          }
                                    %>           
                                 </select>                                
                              </div>                                     
                                 <button name="add_skill" type="submit" class="btn subscrib-btnn">add</button>
                        </div>
                     </form>
                  </div>
               </div>           
            </div>
         </div>
      </div>   
   </div>
   </div>      
   </body>
   </html>