
import Learning.User;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.GoogleAuthenticator;
import auth.SMSAuthenticator;
import auth.SecondFactor;
import auth.Secret;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class VerifyController
 */
@WebServlet("/VerifyController")
public class Verify extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verify() {
        super();
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     try {
         long t = System.currentTimeMillis();
         
         User user = (User) request.getSession().getAttribute("1s_user");
         if(user==null){
             response.sendRedirect(request.getContextPath());
             return;
         }
         
         String codestr = request.getParameter("code");
         long code = Long.parseLong(codestr);
         
         boolean p = false, k = false;

                 if(SecondFactor.get2factor(user.getID(), "phone")!=null);
                 SMSAuthenticator sa = new SMSAuthenticator();
                 sa.setWindowSize(5);  
                 p = sa.check_code(user.getID(), code, t);

                 if(!p){
                    Secret secret= SecondFactor.get2factor(user.getID(), "key");
                    GoogleAuthenticator ga = new GoogleAuthenticator();
                    ga.setWindowSize(5); 
                    k = ga.check_code(secret.Secret, code, t);
                 }
                 

         if(p||k){
             request.getSession().removeAttribute("1s_user");
             request.getSession().setAttribute("user", user);
             response.sendRedirect(request.getContextPath());
         }else{
             request.getSession().removeAttribute("1s_user");
             response.sendRedirect(request.getContextPath());
         }  
     } catch (SQLException ex) {
         throw new ServletException(ex);
     }
     
  
 }

}
