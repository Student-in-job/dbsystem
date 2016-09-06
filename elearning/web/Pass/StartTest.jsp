<%-- 
    Document   : Test
    Created on : Aug 24, 2016, 5:17:51 PM
    Author     : javlonboy
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="Learning.User_courses"%>
<%@page import="Learning.Test"%>
<%@page import="Learning.Course"%>
<%@page import="Learning.AcceptTest"%>

<%@include file="/avtorize.jsp"%>
<%  
    int tst;
    Test test;
        try{
            tst = Integer.parseInt(request.getParameter("test"));
            test = new Test(tst);
        }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}

    if(request.getMethod().equals("POST")){
        
        if(user==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
            
        Course cours; 
        User_courses uhc;
        try{
            cours = user.getActiveCourse(test.getProgramID());
            if(cours==null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+test.getProgramID()); return;}
            uhc = user.getHasCours(cours); 
        }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}

        
        AcceptTest accept = (AcceptTest) session.getAttribute("accept");
        if(accept!=null){response.sendRedirect("PassTest.jsp?no=0"); return;}
            
        Date dt = uhc.getCourse().getSchadule().getDateOf(test);
        if(dt.after(new Date())){%>
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
<% return;     }
        try{
            accept = new AcceptTest(uhc, test);
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       

                    session.setAttribute("accept", accept);
                    response.sendRedirect("PassTest.jsp?no=0");
                    return;
    }

    if(request.getMethod().equals("GET")){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
    </head>
    <body>
        <%@include file="../header.jsp" %>
        
        <div class="row centered text-center test">
            <div class="col col-8 ">
                <h3><%=test.getName()%></h3>
                <h4><a href = "<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=test.getProgram().getID()%>"><%=test.getProgram().getName()%></a></h4>
                <p>
                    <%=test.getInventory()%>
                </p>
            </div>

            <div class="row centered best-results ">
                <h4 class="col col-12">BEST RESULTS</h4>
<%
for(Entry e : test.getStatistic().entrySet()){
%>                
                <div class="col">
                    <span class="chart" data-percent="<%= 100* (int) e.getValue()/test.getBall() %>">
                        <span class="percent"></span>
                        <span class="answers"><br><%=e.getValue()%>/<%=test.getBall()%></span>
                    </span>
                    <p><%=((User)e.getKey()).getName()%> <%=((User)e.getKey()).getSurname()%></p>
                </div>
<%}%>              
            </div>
            <div class="col col-12 test-btn">
<%if(user!=null)if(user.getID()!=test.getProgram().getTeacherID()){%>
                <form method="POST" action="StartTest.jsp">
                <input type="hidden" name="test" value="<%=tst%>">
                <input class="button round outline" type="submit" value="Start test &rarr;">
                </form>
<%}%>   
            </div>             
        </div>
        <%@include file="/footer.jsp" %>
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>


        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.easypiechart.min.js"></script>
        <script>
            $(function () {
                $('.chart').easyPieChart({
                    easing: 'easeOutBounce',
                    onStep: function (from, to, percent) {
                        $(this.el).find('.percent').text(Math.round(percent));
                    }
                });
            });
        </script>

    </body>
</html>
<%}
%>