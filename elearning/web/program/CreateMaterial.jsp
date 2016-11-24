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

<%@include file="../logfrag.jsp" %>
<%   
    request.setCharacterEncoding("UTF-8");
    
    int program = 0;
    Program pg;

        program = Integer.parseInt(request.getParameter("program"));
        pg = new Program(program);
        
       
    if(user.getID()!=pg.getTeacherID()) {response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
            
    
    String typ="Lecture", text=null, name=null, inventory=null;
    int day=0, material = Integer.parseInt(request.getParameter("material")==null?"0":request.getParameter("material"));
    Material nm;
    
    
    if(request.getMethod().equals("GET")){
    if(material!=0){
        

            nm = new Material(material);
             
        typ = nm.getTyp();
        text = nm.getText();
        name = nm.getName();
        inventory = nm.getInventory();
        day = nm.getDay();
        program=nm.getProgramID();
    }
    
}   
if(request.getMethod().equals("POST")){
    
    
    typ = "Lecture";
    text = request.getParameter("text");
    name = request.getParameter("name");
    inventory = request.getParameter("inventory");
    day = Integer.parseInt(request.getParameter("day"));
    
    
        
    
        if(material==0){

                nm = new Material(typ, text, name, inventory, day);    
                nm.Write(pg , user);
                response.sendRedirect("Upload.jsp?material="+nm.getID());
        }
        else{
                nm = new Material(material);
                nm.Change(typ, text, name, inventory, day, user);
                response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+nm.getID());
        }
        }    
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Material</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
        <script src="<%=request.getServletContext().getContextPath()%>/js/tinymce/tinymce.min.js"></script>
        <script>tinymce.init({
    selector: '#input',
    theme: 'modern',
    width: 800,
    height: 400,
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
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="CreateMaterial.jsp" method="post" class="form">
                    <h3 class="text-centered">Material</h3>
                    <input type="hidden" name="program" value="<%=program%>">
                    <input type="hidden" name="material" value="<%=material%>">
                    
                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" value="<%=name!=null?name:""%>" type="text" required>
                    </div>
                    
                    <div class="form-item">
                        <label>Day</label>
                        <input class="width-100" type="number" min="1" name="day" value="<%=day!=0?day:""%>" type="text" required>
                    </div>
                    
                    <div class="form-item">
                    <label>Inventory</label>
                    <textarea rows="6" required name="inventory"><%=inventory!=null?inventory:""%></textarea>
                    </div>
                    
                    <div class="form-item">
                    <label>Text</label>
                    <textarea required name="text" id="input"><%=text!=null?text:""%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        name:{
                            required: true,
                            minlength: 6,
                            maxlength: 50
                        },
                        
                        day:{
                            required: true,
                            number: true,
                            min: 1,
                            max: <%=pg.getDuration()%>
                        },
                        
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 1000
                        }
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>
