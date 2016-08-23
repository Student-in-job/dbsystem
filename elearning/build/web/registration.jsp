<%-- 
    Document   : registration
    Created on : 07.07.2016, 16:49:09
    Author     : ksinn
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
if(request.getMethod()=="GET")
{
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <form action="registration.jsp" method="post">
            <div>
                <p>e-mail:</p>
                <input required type="mail" name="mail" placeholder="ksinn@mai.ru">
            </div>
            <div>
                <p>Password:</p>
                <input required type="password" name="password" placeholder="*****">
            </div>
            <div>
                <p>Name:</p>
                <input required type="text" name="name" placeholder="Kseniya">
            </div>
            <div>
                <p>Surname:</p>
                <input required type="text" name="surname" placeholder="Kseniya">
            </div>
            <div>
                <p>Gender:</p>
                <select required  name="gender">
                    <option selected value="m">Men</option>
                    <option value="w">Women</option>
                </select>
            </div>
            <div>
                <p>Birthday:</p>
                <input required type="date" name="birthday">
            </div> 
            <input type="submit">
        </form>
        
    </body>
</html>
<%
}
else
    if(request.getMethod()=="POST"){

        SimpleDateFormat format = new SimpleDateFormat();
        format.applyPattern("yyyy-MM-dd");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        Date birthday = format.parse(request.getParameter("birthday"));
        
        

        User user = new User(mail, password, name, surname, birthday, gender);
        DataBase db = new DataBase(user);
        if(db.FindUser()!=null){
%>
<!DOCTYPE html>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Registration</title>
                </head>
                <body>
                    <p style="color: red;">Такой мэил уже зарегестрирован</p>
                    <form action="registration.jsp" method="post">
                        <div>
                            <p>e-mail:</p>
                            <input required type="mail" name="mail" value="">
                        </div>
                        <div>
                            <p>Password:</p>
                            <input required type="password" name="password" placeholder="*****">
                        </div>
                        <div>
                            <p>Name:</p>
                            <input required type="text" name="name" value="<%=name%>">
                        </div>
                        <div>
                            <p>Surname:</p>
                            <input required type="text" name="surname" value="<%=surname%>">
                        </div>
                        <div>
                            <p>Gender:</p>
                            <select required  name="gender">
            <%if(gender.equals("m")){%>
                                <option selected value="m">Men</option>
                                <option value="w">Women</option>
            <%}if(gender.equals("w")){%>   
                                <option value="m">Men</option>
                                <option selected value="w">Women</option>
<%}%>
                            </select>
                        </div>
                        <div>
                            <p>Birthday:</p>
                            <input required type="date" name="birthday" value="<%=format.format(birthday)%>">
                        </div> 
                        <input type="submit">
                    </form>

                </body>
            </html>
 <%         return;  
}
        try{
            user.Register();
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
        catch(SQLException ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
           
        response.sendRedirect("login.jsp");
    }
%>