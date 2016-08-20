<%-- 
    Document   : CreateArea
    Created on : 20.08.2016, 12:42:36
    Author     : ksinn
--%>

<%@page import="java.io.IOException"%>
<%@page import="DataBasePak.*"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}
    
    String name = null;
    
    if(request.getMethod()=="POST"){
        
        name = request.getParameter("name");
        
        boolean n = name==null||"".equals(name);
        
        if(!(n)){
        
        try{    
                Area na = new Area(name);
                na.Write(user, request.getPart("picture"));
                response.sendRedirect("/elearning/Area_programs.jsp?area="+na.getID()); return;

            
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IOExtension"); return;} 
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
                 
    }
}    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new program</title>
    </head>
    <body>
        <form action="CreateArea.jsp" method="POST" enctype="multipart/form-data">
            <div>
                <p>Name:</p>
                <input required type="text" name="name" placeholder="MySQL">
            </div>
            <div>
                <p>Picture:</p>
                <input requered type="file" name="picture" >
            </div>            
            <input type="submit">
        </form>
        
    </body>
</html>