<%-- 
    Document   : Program.jsp
    Created on : Aug 25, 2016, 1:52:15 PM
    Author     : javlonboy
--%>

<%@page import="Learning.Task"%>
<%@page import="Learning.User"%>
<%@page import="Learning.Test"%>
<%@page import="Learning.Material"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataBasePak.*"%>
<%@page import="Learning.Program"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
boolean u = false, c=true, r=false;

int program_id = 0;
    Program prog;
        program_id = Integer.parseInt(request.getParameter("course_id"));
        prog = new Program(program_id);
        
    if(user!=null) {u = !prog.isPublished()&&user.getId()==prog.getTeacherID();
                    c = prog.isPublished()&&user.getId()!=prog.getTeacherID();
                    r = prog.isPublished()&&user.getId()==prog.getTeacherID();
                    }
    
    ArrayList<Material> materials = prog.getMaterials();
    ArrayList<Test> tests = prog.getTests();
    ArrayList<Task> tasks = prog.getTasks();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Course :: ${initParam.SiteName} &mdash; 2016 </title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/extend/tabs.js"></script>

        <script>  
        function publish()  
        {  
            $.ajax({  
                url: "${pageContext.request.contextPath}/program/Publishe?program=<%=prog.getId()%>",  
                cache: false, 
                error: function(){
                    document.getElementById('mesagge').style.display = 'block';
                    $("#mesagge").html("Error");
                },
                success: function(data){
                    
                        document.getElementById('mesagge').style.display = 'block';
                        $("#mesagge").html(data); 
                        
                }  
            });  
        } 
         
    </script> 
        
    </head>
    <body>
        <div  class="box " >
            <div id="mesagge" class="middle-text"></div>
        </div>
        <%@include file="header.jsp" %>
        <div class="row centered">
            <div class="col col-8">
                <h3><%=prog.getName()%></h3>

                <div class="row green-bg">



                    <div class="col">
                        <img src="${pageContext.request.contextPath}/<%=prog.getIco()%>" alt="" class="float-left" style="margin-right: 20px; margin-bottom: 20px;">
                        <p class="middle">
                            Type: Selfstudy <br>
                            Area: <a href="${pageContext.request.contextPath}/Courses.jsp?area_id=<%=prog.getArea().getId()%>"><%=prog.getArea().getName()%></a><br>
                            Duration: <%=prog.getDuration()%> days<br>
                            Level: <%=prog.getLevel()%><br>
                            Minimal Level: <%=prog.getMinLevel()%><br>
                            Teacher: <a href="${pageContext.request.contextPath}/User.jsp?user_id=<%=prog.getTeacher().getId()%>"> <%=prog.getTeacher().getName()%> <%=prog.getTeacher().getSurname()%></a> <br>
<%if(u){%>                            
                            <a href="${pageContext.request.contextPath}/program/CreateProgram.jsp?program=<%=prog.getId()%>"><button class="button small round primary">UPDATE</button></a>
                            <a href="${pageContext.request.contextPath}/program/Delete?program=<%=prog.getId()%>"><button class="button small round error">DELETE</button></a>
                            <button class="button small round warning" style="color: #000;" onclick="publish()">PUBLISH</button>

<%}%> 
<%if(c){%>                            
                            <%--<a href="${pageContext.request.contextPath}/CreateCourse.jsp?program=<%=prog.getId()%>"><button class="button small round error">START</button></a>--%>
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
                        <li><a href="#tab13">TASK</a></li>
<%if(r){%>                        <li><a href="#result">RESULT</a></li><%}%>
                    </ul>
                </nav>

                <div id="tab11"  >
<%for(int i=0; i<materials.size(); i++){%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "${pageContext.request.contextPath}/Material.jsp?material_id=<%=materials.get(i).getId()%>"><%=materials.get(i).getName()%></a> 
                            </p>
                        </div>
<%if(u){%>                             
                        <div>
                            <a href="${pageContext.request.contextPath}/program/CreateMaterial.jsp?material=<%=materials.get(i).getId()%>&program=<%=materials.get(i).getProgramID()%>"><button class="button small round primary">UPDATE</button></a>
                            <a href="${pageContext.request.contextPath}/program/Delete?material=<%=materials.get(i).getId()%>"><button class="button small round error">DELETE</button></a>
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
                            <a href="${pageContext.request.contextPath}/program/CreateMaterial.jsp?program=<%=prog.getId()%>"><button class="button small round success">ADD</button></a>
                        </div>
                    </div>
<%}%>                        

                </div>

                <div id="tab12">
<%for(int i=0; i<tests.size(); i++){%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "${pageContext.request.contextPath}/Pass/StartTest.jsp?test=<%=tests.get(i).getId()%>"><%=tests.get(i).getName()%></a>
                            </p>
                        </div>
<%if(u){%> 
                        <div>
                            <a href="${pageContext.request.contextPath}/program/Test.jsp?test=<%=tests.get(i).getId()%>"><button class="button small round primary">UPDATE</button></a>
                           <%if(!tests.get(i).isExem()){%><a href="${pageContext.request.contextPath}/program/Delete?test=<%=tests.get(i).getId()%>"><button class="button small round error">DELETE</button></a><%}%>

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
                            <a href="${pageContext.request.contextPath}/program/CreateTest.jsp?program=<%=prog.getId()%>"><button class="button small round success">ADD</button></a>
                        </div>
                    </div>
<%}%>                        
                </div>
                <div id="tab13">
<%for(int i=0; i<tasks.size(); i++){%>                    
                    <div class="row">
                        <div class="col">
                            <p>
                                <a href = "${pageContext.request.contextPath}/Pass/StartTask.jsp?task=<%=tasks.get(i).getId()%>"><%=tasks.get(i).getName()%></a>
                            </p>
                        </div>
<%if(u){%> 
                        <div>
                            <a href="${pageContext.request.contextPath}/program/Task.jsp?task=<%=tasks.get(i).getId()%>"><button class="button small round primary">UPDATE</button></a>
                           <a href="${pageContext.request.contextPath}/program/Delete?task=<%=tasks.get(i).getId()%>"><button class="button small round error">DELETE</button></a>

                        </div>
<%}%>                            
                    </div>
<%}
if(u){%>                    

                    <div class="row">
                        <div class="col">
                            <p>
                                Create new task 
                            </p>
                        </div>
                        <div>
                            <a href="${pageContext.request.contextPath}/program/CreateTask.jsp?program=<%=prog.getId()%>"><button class="button small round success">ADD</button></a>
                        </div>
                    </div>
<%}%>                        
                </div>
                <div id="result">
<%if(r){
pageContext.setAttribute("rs", prog.getUserMark());
%>
                    <table>
                        <c:forEach var="row" items="${rs}">
                         <tr>
                             <c:forEach var="cell" items="${row}">
                             <td>${cell}</td>
                             </c:forEach>
                         </tr> 
                         </c:forEach>
                    </table>                
                    
<%}%>                        

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>