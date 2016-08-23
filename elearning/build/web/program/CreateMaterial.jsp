<%-- 
    Document   : CreateMaterial
    Created on : 11.07.2016, 16:40:31
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}
        
    String mark=null, url, typ="Lecture", text=null, name=null, inventory=null;
    int day=0, material = Integer.parseInt(request.getParameter("material")), program = Integer.parseInt(request.getParameter("program")==null?"0":request.getParameter("program"));
    Material nm;

    url=material==0?"CreateMaterial.jsp":"EditMaterial.jsp";
    
if(request.getMethod()=="GET"){
    if(material!=0){
        
        try{
            nm = new Material(material);
        }catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
            
        typ = nm.getTyp();
        text = nm.getText();
        name = nm.getName();
        inventory = nm.getInventory();
        day = nm.getDay();
        program=nm.getProgramID();
    }
    
}   
if(request.getMethod()=="POST"){
    
    
    typ = "Lecture";
    text = request.getParameter("text");
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    day = Integer.parseInt(request.getParameter("day")==null?"0":request.getParameter("day"));
    
    boolean n = name==null||"".equals(name);
    boolean i = inventory==null||"".equals(inventory);
    boolean d = day<=0;
    if(!(n||d||i)){
        
    try{    
        if(material==0){

                Program prog = new Program(program);
                nm = new Material(typ, text, name, inventory, day);    
                nm.Write(prog , user);
                response.sendRedirect("Upload.jsp?material="+nm.getID());
        }
        else{
                nm = new Material(material);
                nm.Change(typ, text, name, inventory, day, user);
                response.sendRedirect("Material.jsp?material="+nm.getID());
        }
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
        <title>Create new material</title>
        <script type="text/javascript" src="/elearning/js/jquery-1.5.2.min.js"></script> 
        <script type="text/javascript" src="/elearning/js/jquery.validate.min.js"></script> 
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({
    selector: '#input',
    theme: 'modern',
    width: 600,
    height: 300,
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table contextmenu directionality emoticons template paste textcolor'
    ],
    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons'
  });
        </script>
        
    </head>
    <body>
        
        <h1>Create new material</h1>
        <h1><%=mark==null?"":mark%></h1>
        <form id="form" method="POST" action="<%=url%>">
            <input type="hidden" name="program" value="<%=program%>">
            <input type="hidden" name="material" value="<%=material%>">
            <div>
                <p>Name: </p>
                <input requered type="text" name="name" <%=name==null?" placeholder=\"Name":"value=\""+name%>">
            </div>
            <div>
                <p>Day: </p>
                <input requered type="number" min="1" name="day" <%=day==0?" placeholder=\"1":"value=\""+day%>" >
            </div>
            <div>
                <p>Inventory: </p>
                <textarea requered name="inventory" <%=inventory==null?" placeholder=\"Inventory\">":">"+inventory%></textarea>
            </div>
            <div>
                <p>Text: </p>
                <textarea requered name="text" id="input"><%=text==null?"":text%></textarea>
            </div> 
            <input type="submit"> 
        </form>
        
            
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        name:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        day:{
                            required: true,
                            number: true,
                            min: 1
                        },
                        
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 200,
                        },
                        
                        text:{
                            required: true,
                            minlength: 20,
                        }
                        
                   },

                   messages:{

                        name:{
                            required: "Это поле обязательно для заполнения",
                            minlength: "Название должен быть минимум 6 символа",
                            maxlength: "Максимальное число символо - 100",
                        },
                        
                        day:{
                            requered: "Это поле обязательно для заполнения",
                            number: "Должно быть число",
                            min: "1"
                        },
                        
                        inventory:{
                            requered: "Это поле обязательно для заполнения",
                            minlength: "Название должен быть минимум 20 символа",
                            maxlength: "Максимальное число символо - 200",
                        },
                        
                        text:{
                            requered: "Это поле обязательно для заполнения",
                            minlength: "Название должен быть минимум 20 символа",
                        }

                   }

                });


            }); //end of ready
        </script>    
    </body>
</html>
