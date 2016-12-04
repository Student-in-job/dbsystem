package Controller.user;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import Controller.HttpServletParent;
import Model.User;
import auth.SMSAuthenticator;
import auth.Secret;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author ksinn
 */
public class auth1 extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try{    
            
                String mail = request.getParameter("m")==null?"ksinnd@gmail.com":request.getParameter("m");
                User user = new User();
                if(user.getByMail(mail)){
                    request.getSession().setAttribute("1s_user", user);                    
                    Secret secret = user.getSecondFactor();
                        if(secret!=null){
                            if("phone".equals(secret.Type)){
                                SMSAuthenticator sms = new SMSAuthenticator();
                            if(sms.sendSMS(user.getId(), secret.Secret)){
                            } else{
                            
                            }
                        }
                            request.getRequestDispatcher("VerifyCode.jsp").forward(request, response);
                            return;
                        } else {
                            response.sendRedirect("SetUp");
                            return;
                        }
                }
                        
            
            
            
               
            response.sendRedirect(request.getContextPath());
        } catch (Exception ex){
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForUnAuthorized;
    }

}