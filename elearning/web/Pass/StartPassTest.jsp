<%-- 
    Document   : StartPassTest
    Created on : 10.08.2016, 12:17:55
    Author     : ksinn
--%>

<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user!=null){
   
    if(request.getMethod().equals("POST")){
        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept==null){
            User_courses uhc = new User_courses(Integer.parseInt(request.getParameter("uhc")));
            Test test = new Test(Integer.parseInt(request.getParameter("test")));

            try{accept = new AcceptTest(uhc, test);}
            catch(Exception ex){response.sendError(500, "Material not exist!");}
            session.setAttribute("accept", accept);
            response.sendRedirect("PassTest.jsp?no=0");
        }
        else{
            response.sendRedirect("PassTest.jsp?no=0");
        }
    }
    else{
    
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Do yuo whant statrt test!</h1>
        <form method="POST" action="StartPassTest.jsp">
            <input type="hidden" name="uhc" value="<%=request.getParameter("uhc")%>">
            <input type="hidden" name="test" value="<%=request.getParameter("test")%>">
            <input type="submit" value="Start">
        </form>
    </body>
</html>
<%}}
%>