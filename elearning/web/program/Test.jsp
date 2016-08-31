<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/logfrag.jsp"%>
<%
    Test test;
    try{
        test = new Test(Integer.parseInt(request.getParameter("test"))); 
        if(test.getProgram().getTeacherID()!=user.getID()) throw new IllegalAction();
    }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    ArrayList<TestTask> task = test.getTask();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>

        <div class="test-edit test">
            <div class="row ">
                <div class="col col-2 offset-1">
                    <h3><%=test.getName()%></h3>
                </div>
                <div class="col">
                    <a href="CreateTest.jsp?program=<%=test.getProgramID()%>&test=<%=test.getID()%>">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
            </div>
<%for(int i=0; i<task.size(); i++){%>                         
            <div class="row">
                <div class="col offset-1">
                    <p><%=task.get(i).getQuestion()%> (<%=task.get(i).getPoint()%>)</p>
                    <form method="post" action="" class="form">
                        <div class="form-item checkboxes">
                            <label><input type="radio"> <%=task.get(i).getAnswer()%></label>
                            <label><input type="radio"> <%=task.get(i).getVariant1()%></label>
                            <label><input type="radio"> <%=task.get(i).getVariant1()%></label>
                            <label><input type="radio"> <%=task.get(i).getVariant1()%></label>
                            <label><input type="radio"> <%=task.get(i).getVariant1()%></label>
                        </div>
                    </form>
                </div>
                <div class="col">
                    <a href="Delete?testtask=<%=task.get(i).getID()%>">
                        <i class="fa fa-trash font-green"></i> Delete
                    </a> 
                    <a href="CreateTestTask.jsp?test=<%=test.getID()%>&testtask=<%=task.get(i).getID()%>">
                        <i class="fa fa-cog font-green"></i> Edit
                    </a>
                </div>
            </div>
<%}%>            
                        
            <div class="col">
                <a href="CreateTestTask.jsp?testtask=0&test=<%=test.getID()%>">
                    <button class="button round outline small">
                        Add test <i class="fa fa-plus" aria-hidden="true"></i>

                    </button>
                </a>
            </div>
            <div class="text-center">
                <button class="button round  green-bg">
                    Confirm <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
            </div>

        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
