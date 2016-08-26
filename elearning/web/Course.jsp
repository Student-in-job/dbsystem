<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
--%>

<%@page import="Learning.User"%>
<%@page import="Learning.Test"%>
<%@page import="Learning.Material"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataBasePak.*"%>
<%@page import="Learning.Program"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="avtorize.jsp"%>
<%
boolean u = false, c=true;

int program_id = 0;
    Program prog;
    try{
        program_id = Integer.parseInt(request.getParameter("course_id"));
        prog = new Program(program_id);
        
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
    
    if(user!=null) {u = !prog.isPublished()&&user.getID()==prog.getTeacherID();
                    c = prog.isPublished()&&user.getID()!=prog.getTeacherID();}
    
    ArrayList<Material> materials = prog.getMaterials();
    ArrayList<Test> tests = prog.getTests();
    
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
<%if(u){%>                            
                            <a href="<%=request.getServletContext().getContextPath()%>/program/CreateProgram.jsp?program=<%=prog.getID()%>"><button class="button small round success">UPDATE</button></a>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/Delete?program=<%=prog.getID()%>"><button class="button small round success">DELETE</button></a>
<%}%> 
<%if(c){%>                            
                            <a href="<%=request.getServletContext().getContextPath()%>/CreateCourse.jsp?program=<%=prog.getID()%>"><button class="button small round success">START</button></a>
<%}%> 
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
<%for(int i=0; i<materials.size(); i++){%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "<%=request.getServletContext().getContextPath()%>/Material.jsp?material_id=<%=materials.get(i).getID()%>"><%=materials.get(i).getName()%></a>. 
                            </p>
                        </div>
<%if(u){%>                             
                        <div>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/CreateMaterial.jsp?material=<%=materials.get(i).getID()%>&program=<%=materials.get(i).getProgramID()%>"><button class="button small round success">UPDATE</button></a>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/Delete?material=<%=materials.get(i).getID()%>"><button class="button small round primary">DELETE</button></a>
                        </div>
<%}%>                        
                    </div>
<%}
if(u){%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                Create new material 
                            </p>
                        </div>
                        <div>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/CreateMaterial.jsp?program=<%=prog.getID()%>"><button class="button small round error">ADD</button></a>
                        </div>
                    </div>
<%}%>                        

                </div>

                <div id="tab12">
<%for(int i=0; i<tests.size(); i++){%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "<%=request.getServletContext().getContextPath()%>/Pass/StartTest.jsp?test=<%=tests.get(i).getID()%>"><%=tests.get(i).getName()%></a>. 
                            </p>
                        </div>
<%if(u){%> 
                        <div>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/Test.jsp?test=<%=tests.get(i).getID()%>"><button class="button small round success">UPDATE</button></a>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/Delete?test=<%=tests.get(i).getID()%>"><button class="button small round primary">DELETE</button></a>

                        </div>
<%}%>                            
                    </div>
<%}
if(u){%>                    

                    <div class="row">
                        <div class="col">
                            <p>
                                Create new test 
                            </p>
                        </div>
                        <div>
                            <a href="<%=request.getServletContext().getContextPath()%>/program/CreateTest.jsp?program=<%=prog.getID()%>"><button class="button small round error">ADD</button></a>
                        </div>
                    </div>
<%}%>                        
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
