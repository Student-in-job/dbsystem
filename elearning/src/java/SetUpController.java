

import Learning.User;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

import auth.GoogleAuthenticator;

/**
 * Servlet implementation class SetUpController
 */
@WebServlet("/SetUpController")
public class SetUpController extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   this.doPost(request, response);
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
 User user = (User) request.getSession().getAttribute("1s_user");
 request.getSession().removeAttribute("1s_user");
 
 if(user==null){
    response.sendRedirect(request.getServletContext().getContextPath());
    return;
 }
  
  String secretKey = GoogleAuthenticator.generateSecretKey();
  
  //request.getSession().setAttribute( "secretKey", secretKey );
  
  GoogleAuthenticator.putSecretKey(user.getID(), secretKey);
  
  String s = "otpauth://totp/"+user.getMail()+"?secret="+secretKey;

  ByteArrayOutputStream outs = QRCode.from(s).to(ImageType.PNG).stream();

  response.setContentType("image/png");
  response.setContentLength(outs.size());
  
  OutputStream outStream = response.getOutputStream();
  
  outStream.write(outs.toByteArray());
  
  outStream.flush();
  outStream.close();

 }

}