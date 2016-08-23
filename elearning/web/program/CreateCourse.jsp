<%-- 
    Document   : CreateCours
    Created on : 02.08.2016, 15:24:36
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="Learning.Material"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;} 
   
    Course course = (Course) session.getAttribute("course");
    ArrayList<Test> test = (ArrayList<Test>) session.getAttribute("test");
    ArrayList<Material> material = (ArrayList<Material>) session.getAttribute("material");
    
    SimpleDateFormat form = new SimpleDateFormat();
    form.applyPattern("yyyy-MM-dd");
    SimpleDateFormat form2 = new SimpleDateFormat();
    form2.applyPattern("yyyy-MM-dd HH:mm:ss"); 
    
    if(request.getParameter("create")!=null){
        ArrayList<Component> comp = new ArrayList<Component>();
        comp.addAll(material);
        comp.addAll(test);
        try{
            course.Write(user, comp);
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
        session.removeAttribute("course");
        session.removeAttribute("material");
        session.removeAttribute("test");

    }
    else{

    int program = Integer.parseInt(request.getParameter("program")); 
    try{
        Program prog = new Program(program);
        
        if((!prog.isPublished())/*&&prog.getCourse()!=null**/) {
            %>
<!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
            </head>
            <body>
                <p>Вы не можете начать курс по этой программе</p>
            </body>
        </html>

<%
        }
        else{
            if(course==null){
                if(request.getMethod().equals("GET")){%>
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <script type="text/javascript" src="/elearning/js/jquery-1.5.2.min.js"></script> 
                <script type="text/javascript" src="/elearning/js/jquery.validate.min.js"></script> 
            </head>
            <body>
                <h1>CreateCourse:1</h1>
                <form id="form" method="POST" action="CreateCourse.jsp">
                    <input type="hidden" name="program" value="<%=program%>">
                    <div>
                        <p>Start Date:</p>
                        <input required type="date" name="start" value="<%=form.format(new Date(new Date().getTime() + 3600*1000*24*8))%>">
                    </div>
                    <input type="submit">
                </form>
    
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        start:{
                            required: true,
                            date: true,
                            maxlength: 100,
                        }                        
                   },

                });


            }); //end of ready
        </script>
            </body>
        </html>
                <%}
                if(request.getMethod().equals("POST")){

                        Date start = form.parse(request.getParameter("start"));
                        if(start.compareTo(new Date(new Date().getTime() + 3600*1000*24*7))<0) 
                            {%>
        <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <script type="text/javascript" src="/elearning/js/jquery-1.5.2.min.js"></script> 
                <script type="text/javascript" src="/elearning/js/jquery.validate.min.js"></script> 
            </head>
            <body>
                <h1>CreateCourse:1</h1>
                <form id="form" method="POST" action="CreateCourse.jsp">
                    <input type="hidden" name="program" value="<%=program%>">
                    <div>
                        <p>Start Date:</p>
                        <input required type="date" name="start" value="<%=form.format(new Date(new Date().getTime() + 3600*1000*24*8))%>">
                    </div>
                    <input type="submit">
                </form>
    
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        start:{
                            required: true,
                            date: true,
                            maxlength: 100,
                        }                        
                   },

                });


            }); //end of ready
        </script>
            </body>
        </html>
                <% return;}
                        course = new Course(start, prog);
                        session.setAttribute("course", course);
                        response.sendRedirect("CreateMaterialSchedule.jsp?program="+String.valueOf(program));
                }
            }
            else response.sendRedirect("CreateMaterialSchedule.jsp?program="+String.valueOf(program));

        }
    }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
    catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
    

}

%> 
