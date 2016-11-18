
import Learning.User;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.GoogleAuthenticator;

/**
 * Servlet implementation class VerifyController
 */
@WebServlet("/VerifyController")
public class VerifyController extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyController() {
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

  User user = (User) request.getSession().getAttribute("1s_user");
  if(user==null){
      response.sendRedirect("/elearningzz");
  }
     
  String codestr = request.getParameter("code");
  long code = Long.parseLong(codestr);
  
  long t = System.currentTimeMillis();
  GoogleAuthenticator ga = new GoogleAuthenticator();
  ga.setWindowSize(5);  //should give 5 * 30 seconds of grace...
  
  String savedSecret = GoogleAuthenticator.getSecretKey(user.getID());

  boolean r = ga.check_code(savedSecret, code, t);
  
  PrintWriter pw = response.getWriter();
  
  if(r){
    request.getSession().removeAttribute("1s_user");
    request.getSession().setAttribute("user", user);
    response.sendRedirect("/elearningzz");
  }else{
    request.getSession().removeAttribute("1s_user");
    response.sendRedirect("/elearningzz");
  }
  
 }

}
