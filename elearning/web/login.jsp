<%--
    Document   : authorization
    Created on : 07.07.2016, 16:32:34
    Author     : ksinn
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = (String) session.getAttribute("rederectto");
    session.removeAttribute("rederectto");
    if(path==null) path ="";
    if(request.getParameter("logout")!=null){
        response.addCookie(new Cookie("usermail", null));
        response.addCookie(new Cookie("password", null));
        request.getSession().invalidate();
        RequestDispatcher view = request.getRequestDispatcher(path);
        view.forward(request, response);
        //response.sendRedirect(path);
        return;
    }    
%>
<%@include file="/avtorize.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">

            <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
            <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
    </head>
    <body>
        <%@include file="/header.jsp"%>
        <% 
            if(user!=null) {
                response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp");
                return;
            }
            String mail = "";
            String password = "";
            String hashp = "";
            boolean a = false;
            //response.getWriter().write(request.getMethod());
            if(request.getMethod().equals("POST")){
                mail = request.getParameter("mail");
                password = request.getParameter("password");
                hashp = DigestUtils.md2Hex(password);
                User nuser = new User(mail, hashp);
                try{
                    a = nuser.Authorize();
                }
                catch(ObjectNotFind ex){
                    Log.getOut(ex.getMessage());
                }
                catch(Exception ex){
                    Log.getOut(ex.getMessage());
                    response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp");
                    return;
                }
                if(a)
                {
                    if(request.getParameter("remember")!=null){
                        Cookie m = new Cookie("usermail", nuser.getMail()); 
                        m.setMaxAge(3600*24*30);
                        Cookie p = new Cookie("password", DigestUtils.md2Hex(nuser.getPassword())); 
                        p.setMaxAge(3600*24*30);
                        response.addCookie(m);
                        response.addCookie(p);
                    }
                    request.getSession().setAttribute("user", nuser);
                    response.sendRedirect(path);
                    return;
                }
            }
        %>
        <div class="row around">
            <div class="col col-4">		
                <div class="modal">
                    <div class="modal-header">Sign in</div>
                    <div class="modal-body">
                        <form method="post" action="login.jsp" class="form">
                            <input name="rederectto" type="hidden" value="<%=path%>">
                            <% if(a){%>
                                <div class="form-item">
                                    <span class="req">The email and password that you entered don't match.</span>
                                </div>
                            <%}%>
                            <div class="form-item">
                                <label>Email <span class="req">*</span></label>
                                <input type="email" name="mail" class="width-100" required>
                            </div>
                            <div class="form-item">
                                <label>Password <span class="req">*</span></label>
                                <input type="password" name="password" class="width-100" required>
                            </div>
                            <label class="form-item checkbox">
                                <input type="checkbox" name="remember" value="ok"> Remember me
                            </label>
                            <div class="form-item">
                                <button class="button primary width-100 big">Log in</button>		
                            </div>
                            <hr>
                            <p class="text-center">Don`t have an account yet? <a href="Registration.jsp">Sign Up</a></p>    
                            <p class="text-center"><a href="ResetPassword.jsp" >Lost your password?</a></p>
                        </form>
                    </div> 
                </div>
            </div>
	</div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
