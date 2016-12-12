package Controller.user;


import Controller.HttpServletParent;
import Model.User;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/VerifyController")
public class VerifyCode extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
         long t = System.currentTimeMillis();
         
         User user = (User) request.getSession().getAttribute("1s_user");
         if(user==null){
             response.sendRedirect(request.getContextPath());
             return;
         }
         
         String codestr = request.getParameter("code");
         long code = Long.parseLong(codestr);
         
         boolean p = user.LogIn(code, t, request.getHeader("user-agent")+"; "+request.getHeader("x-forwarded-for"));

         String mess;
         if(p){
             request.getSession().removeAttribute("1s_user");
             request.getSession().setAttribute("user", user);
             mess = "Welcome "+user.getName()+"!";
         }else{
             request.getSession().removeAttribute("1s_user");
             mess = "Invalid code!";
         }  
         request.setAttribute("message", mess);
         request.getRequestDispatcher("/Message.jsp").forward(request, response);

    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForUnAuthorized;
    }

}
