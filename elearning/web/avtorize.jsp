<%-- 
    Document   : avtorize
    Created on : 25.08.2016, 19:46:21
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="Learning.User"%>
<%@page import="org.apache.commons.codec.digest.*"%>
<%
User user = (User) session.getAttribute("user");
if(user==null) {
    String mail=null, cpassword = null;
    Cookie[] c = request.getCookies();
    for(int i=0; i<c.length; i++){
        if(c[i].getName().equals("usermail")){
            mail = c[i].getValue();
            for(int j=0; j<c.length; j++){
                if(c[j].getName().equals("password")){
                    cpassword = c[j].getValue();
                    break;
                }
            }
            break;
        }
    }
    if(mail!=null&&cpassword!=null){
        

        
        user = new User(mail, cpassword);
        boolean a=false;
        try{
            a = user.Authorize();
        }catch(Exception ex){Log.getOut(ex.getMessage());}
        if(a){
            session.setAttribute("user", user);
        }
        else{
            user = null;
        }
    }
}
%>
