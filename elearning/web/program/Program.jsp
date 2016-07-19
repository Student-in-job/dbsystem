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
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    
    ArrayList<Program> list = user.getPrograms();
    ArrayList<Material> mtr;
    ArrayList<Test> tst;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.getName()%>'s programs</title>
    </head>
    <body>
        <h1><%=user.getName()%>'s programs></h1>
<%
    for(int i=0; i<list.size(); i++){
            
            
%>
        <article style="border: 1px solid black;">
            <h2>
                Name: <%=list.get(i).getName()%>
                <a href="EditProgram.jsp?program=<%=list.get(i).getID()%>">edit</a>
                <a href="Delete?program=<%=list.get(i).getID()%>">-</a>
            </h2>
             <h3>Typ: <%=list.get(i).getTyp()%></h3>
             <p>Typ: <%=list.get(i).getInventory()%></p>
             <p>
                 <a href="CreateMaterial.jsp?program=<%=list.get(i).getID()%>&material=0" alt="Create new material in this program">add Material</a>
                 <a href="CreateTest.jsp?program=<%=list.get(i).getID()%>&test=0" alt="Create new test in this program">add Test</a>
             </p>
             <h3>Material:</h3>
             <ul>
              
<%
mtr = list.get(i).getMaterial();
for(int j=0; j<mtr.size(); j++){
    %>
                <li><a href="Material.jsp?material=<%=mtr.get(j).getID()%>"><%=mtr.get(j).getName()%></a> (<%=mtr.get(j).getDay()%>)</li>
             
<%}
%>           </ul> 
             <h3>Test:</h3>
             <ul>
              
<%
tst = list.get(i).getTest();
for(int j=0; j<tst.size(); j++){
    %>
                <li><a href="Test.jsp?test=<%=tst.get(j).getID()%>"><%=tst.get(j).getName()%></a> (<%=tst.get(j).getDay()%>)</li>
             
<%}
%>           </ul> 
        </article>
<%}%>
    </body>
</html>