<%-- 
    Document   : CreateTest
    Created on : 13.07.2016, 13:51:17
    Author     : ksinn
--%>

<%@page import="DataBase.Log"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
try{
    
    
    User user = (User) session.getAttribute("user");
    if(user!=null&&user.isLogined()){
    
    String url=null, name=null, inventory = null, mark="";
    int day=0, test, program;
    Test nt;
    program = Integer.parseInt(request.getParameter("program")==null?"0":request.getParameter("program"));
    test = Integer.parseInt(request.getParameter("test")==null?"0":request.getParameter("test"));
    url = 0==test?"CreateTest.jsp":"EditTest.jsp";
    
if(request.getMethod()=="GET"){
    if(test!=0){
        
        nt = new Test(test);
        name = nt.getName();
        day = nt.getDay();
        inventory = nt.getInventory();
        program = nt.getProgramID();

    }
    
}    
if(request.getMethod()=="POST"){
    
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    try{
    day = Integer.parseInt(request.getParameter("day"));}
    catch(Exception ex){day=0;}
    
    if(test==0){
        
        nt = new Test(name, day, inventory);
        mark = nt.Write(new Program(program), user);
        if(mark==null)
                    response.sendRedirect("Program.jsp?program="+program);
    }
    else{
        
        nt = new Test(test);
        mark = nt.Change(name, inventory, day, user);
        if(mark==null)
                response.sendRedirect("Program.jsp?program="+program);
    }   
      
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Test</title>
    </head>
    <body>
        <h1>Create Test</h1>
        <h2><%=mark%></h2>
        <form action="<%=url%>" method="POST">
        <input type="hidden" name="program" value="<%=program%>"> 
        <input type="hidden" name="test" value="<%=test%>"> 
            <div>
                <p>Name:</p>
                <input requered type="text" name="name" <%=name==null?" placeholder=\"Name of test":"value=\""+name%>">
            </div>
            <div>
                <p>Inventory:</p>
                <textarea requered name="inventory"><%=inventory==null?"":inventory%></textarea>
            </div>
            <div>
                <p>Day:</p>
                <input requered min="1" max="183" type="number" name="day" <%=day==0?" placeholder=\"1":"value=\""+day%>">
            </div>
            <input type="submit">
        </form>
    </body>
</html>
<%}
else response.sendRedirect("login.jsp");

}
catch(Exception ex){
Log.getOut(ex.getMessage());
    response.sendRedirect("/elearning/Error.jsp");
}
%>