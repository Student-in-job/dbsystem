<%-- 
    Document   : Program
    Created on : 11.07.2016, 11:12:30
    Author     : ksinn
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    User user = (User) session.getAttribute("user");
    if(user!=null&&user.isLogined()){
            
    Program program = new Program(request.getParameter("program"));
    ArrayList<Material> mtr = program.getMaterial();
    ArrayList<Test> tst = program.getTest();
    ArrayList<Files> file = program.getFile();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.getName()%>'s programs</title>
    </head>
    <body>
        <article style="border: 1px solid black;">
            <h1><%=program.getName()%></h1>
            <h6>
                <a href="EditProgram.jsp?program=<%=program.getID()%>">Edit</a>
                <a href="Delete?program=<%=program.getID()%>">Delete</a>
            </h6>
             <p>Typ: <%=program.getTyp()%></p>
             <p>Area: <%=program.getAreaName()%></p>
             <p>Duration: <%=program.getDuration()%></p>
             <p>Level: <%=program.getLevel()%> <p>MinLevel: <%=program.getMinLevel()%></p></p>
             <p>Inventory: <%=program.getInventory()%></p>
             <h3>
                 Material: 
                 <a href="CreateMaterial.jsp?program=<%=program.getID()%>&material=0" alt="Create new material in this program">+</a>
             </h3>
             <ul>
              
<%if(!mtr.isEmpty())for(int j=0; j<mtr.size(); j++){%>
                <li>
                    (<%=mtr.get(j).getDay()%>) 
                    <a href="Material.jsp?material=<%=mtr.get(j).getID()%>"><%=mtr.get(j).getName()%></a>
                    <a href="EditMaterial.jsp?material=<%=mtr.get(j).getID()%>">*</a>
                    <a href="Delete?material=<%=mtr.get(j).getID()%>">-</a>
                </li>            
<%}%>           </ul> 
             
            <h3>
                Test:
                <a href="CreateTest.jsp?program=<%=program.getID()%>&test=0" alt="Create new test in this program">+</a>
            </h3>
             <ul>
              
<%if(!tst.isEmpty())for(int j=0; j<tst.size(); j++){%>
                <li>
                    (<%=tst.get(j).getDay()%>)
                    <a href="Test.jsp?test=<%=tst.get(j).getID()%>"><%=tst.get(j).getName()%></a>
                    <a href="EditTest.jsp?test=<%=tst.get(j).getID()%>">*</a>
                    <a href="Delete?test=<%=tst.get(j).getID()%>">-</a>
                </li>
             
<%}%>           </ul> 

            <h3>
                File:
                <a href="Upload.jsp?program=<%=program.getID()%>" alt="Upload new file in this program">+</a>
            </h3>
             <ul>
              
<%if(!file.isEmpty())for(int j=0; j<file.size(); j++){%>
                <li>
                    <p><a href="<%=file.get(j).getURL()%>"><%=file.get(j).getName()%></a></p>
                </li>
             
<%}%>           </ul> 
        </article>
    </body>
</html>
<%}
else response.sendRedirect("../login.jsp");
%>