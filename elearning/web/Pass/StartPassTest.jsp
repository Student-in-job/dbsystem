<%-- 
    Document   : StartPassTest
    Created on : 10.08.2016, 12:17:55
    Author     : ksinn
--%>

<%@page import="DataBase.*"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("user");
if(user==null) {response.sendRedirect("login.jsp"); return; }
   
    if(request.getMethod().equals("POST")){
        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept==null){
            int cours = Integer.parseInt(request.getParameter("course"));
            try{
                User_courses uhc = user.getHasCours(new Course(cours));
                Test test = new Test(Integer.parseInt(request.getParameter("test")));

                Date dt = uhc.getCourse().getSchadule().getDateOf(test);
                if(dt.after(new Date())){
                    accept = new AcceptTest(uhc, test);
                    session.setAttribute("accept", accept);
                    response.sendRedirect("PassTest.jsp?no=0");
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
        <h1>Time for this test left!</h1>
    </body>
</html>
<%
                    }
            }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
            catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
            catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
            catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        }
        else{
            response.sendRedirect("PassTest.jsp?no=0");
        }
        
    }

    if(request.getMethod().equals("GET")){
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
            <input type="hidden" name="course" value="<%=request.getParameter("course")%>">
            <input type="hidden" name="test" value="<%=request.getParameter("test")%>">
            <input type="submit" value="Start">
        </form>
    </body>
</html>
<%}
%>