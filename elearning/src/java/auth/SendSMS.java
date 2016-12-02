/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import Controller.HttpServletParent;
import Model.User;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class SendSMS extends HttpServletParent {

   
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
            user = (User) request.getSession().getAttribute("1s_user");
            Secret key = SecondFactor.get2factor(user.getId(), "phone");
                if(key!=null){
                    SMSAuthenticator sms = new SMSAuthenticator();
                    if(sms.sendSMS(user.getId(), key.Secret)){
                        request.getSession().setAttribute("type", "phone");
                        out.write("SMS send;");
                    } else
                        out.write("SMS getway is temporarily unavailable!<br>Pleas use Google Autentificator code;");
                } else 
                    response.sendRedirect("SetUpPhone.jsp");
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
