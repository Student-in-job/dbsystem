<%-- 
    Document   : CreateProgram
    Created on : 08.07.2016, 15:12:56
    Author     : ksinn
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Learning.*"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user==null||!user.isLogined())
        response.sendRedirect("../login.jsp");
    


        if(request.getMethod()=="POST"){%>
       
<jsp:setProperty name="nProgram" property="*" />          
        <%              
            NewProgram np = (NewProgram) session.getAttribute("nProgram");
            if(np.isGood())
                if(user.CreateProgram(np))
                {
                    session.removeAttribute("nProgram");
                    response.sendRedirect("Program.jsp");
                }
        }

%>
<jsp:useBean id="nProgram" class="Learning.NewProgram" scope="session"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new program</title>
    </head>
    <body>
        
        <h1>Create new program: first step</h1>
        <form action="CreateProgram.jsp" method="POST">
            <div>
                <p>Name:</p>
                <input type="text" name="name" value="<jsp:getProperty name="nProgram" property="name"/>">
            </div>
            <div>
                <p>Area:</p>
                <select name="area" >
<%
    HashMap<Integer, String> arealist = Program.getAreaList();
    for(Entry entry : arealist.entrySet()){
    
%>
                    <option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
<%}%>
                </select>
            </div>
            <div>
                <p>Inventory:</p>
                <textarea type="inventory" name="inventory"><jsp:getProperty name="nProgram" property="inventory"/></textarea>
            </div>
            <div>
                <p>Type:</p>
                <select name="typ" value="<jsp:getProperty name="nProgram" property="typ"/>">
                    <option value="Seminar">Seminar</option>
                    <option value="Mini">Mini-Cours</option>
                    <option required value="Standard">Standard cours</option>
                </select>
            </div>
                   
        <h1>Create new program: second step</h1> 
            <div>
                <p>Leavel:</p>
                <p>Какой уровень знаний будет после прохождения курса</p>
                <select name="leavel">
                    <option value="1">Beginner</option>
                    <option required value="2">Intermediate</option>
                    <option value="3">Advanced</option>
                </select>
            </div>
            <div>
                <p>Min - Leavet:</p>
                <p>Какого уровня курс надо прайти, для зачисления</p>
                <select name="minleavel">
                    <option required value="0">Not need</option>
                    <option value="1">Beginner</option>
                    <option value="2">Intermediate</option>
                    <option value="3">Advanced</option>
                </select>
            </div>
            <div>
                <p>Duration:</p>
                поставить условие длительности
                <input type="number" name="duration" value="<jsp:getProperty name="nProgram" property="duration"/>"> days.
            </div>
            <input type="submit">
        </form>
        
    </body>
</html>
