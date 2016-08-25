<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
--%>

<%@page import="Learning.Test"%>
<%@page import="Learning.Material"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataBasePak.*"%>
<%@page import="Learning.Program"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
int program_id = 0;
    Program prog;
    try{
        program_id = Integer.parseInt(request.getParameter("course_id"));
        prog = new Program(program_id);
        
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    ArrayList<Material> mtr = prog.getMaterials();
    ArrayList<Test> tst = prog.getTests();
    
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Program</title>
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
        <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
        <script src="<%=request.getServletContext().getContextPath()%>/js/extend/tabs.js"></script>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="row centered">
            <div class="col col-8">
                <h3><%=prog.getName()%></h3>

                <div class="row green-bg">



                    <div class="col col-8">
                        <img src="<%=request.getServletContext().getContextPath()%>/<%=prog.getIco()%>" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                        <p class="middle">
                            Type: Selfstudy <br>
                            Area: <%=prog.getArea().getName()%><br>
                            Duration: <%=prog.getDuration()%> days<br>
                            Level: <%=prog.getLevel()%><br>
                            Minimal Level: <%=prog.getMinLevel()%><br>
                            Teacher: <a href="<%=request.getServletContext().getContextPath()%>/User.jsp?user_id=<%=prog.getTeacher().getID()%>"> <%=prog.getTeacher().getName()%> <%=prog.getTeacher().getSurname()%></a> <br>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p>
                            <%=prog.getInventory()%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row centered  course-2">
            <div class="col col-8">
                <nav class="tabs" data-component="tabs" data-equals="true">
                    <ul>
                        <li class="active"><a href="#tab11">MATERIAL</a></li>
                        <li><a href="#tab12">TEST</a></li>
                    </ul>
                </nav>

                <div id="tab11"  >
                    <div class="row">
                        <div class="col">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                            </p>
                        </div>
                        <div>
                            <button class="button small round success">UPDATE</button>
                            <button class="button small round primary">DELETE</button>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <p>
                                Create new material 
                            </p>
                        </div>
                        <div>
                            <button class="button small round error">ADD</button>
                        </div>
                    </div>

                </div>

                <div id="tab12">
                    <div class="row">
                        <div class="col">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                            </p>
                        </div>
                        <div>
                            <button class="button small round success">UPDATE</button>
                            <button class="button small round primary">DELETE</button>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <p>
                                Create new test 
                            </p>
                        </div>
                        <div>
                            <button class="button small round error">ADD</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
