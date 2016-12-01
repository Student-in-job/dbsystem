package Controller.user;



import API.AppInf;
import API.HTTPClient;
import Model.User;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.SMSAuthenticator;
import auth.Secret;

/**
 * Servlet implementation class SetUpController
 */
@WebServlet("/SetUpPhone")
public class SetUpPhone extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetUpPhone() {
        super();
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
     try {
         User user = (User) request.getSession().getAttribute("1s_user");
         
         if(user==null){
             response.sendRedirect(request.getServletContext().getContextPath());
             return;
         }
         
         String phone = "998"+request.getParameter("prefix")+request.getParameter("phone");
         
         Secret key = new Secret();
         key.Secret = phone;
         key.Type = "phone";
         
         
         SMSAuthenticator.put2factor(user.getId(), key);
         
         String param = "phone="+phone+"&text=this phone saved in system";
         
         HTTPClient client = new HTTPClient(AppInf.main+"/smsgetway", param, "POST");
         client.sendRequest();
         
         response.sendRedirect("SendSMS");
         
     } catch (Exception ex) {
         throw new ServletException(ex);
     }

 }

}