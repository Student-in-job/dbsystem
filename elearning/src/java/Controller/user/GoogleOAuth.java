package Controller.user;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import API.AppInf;
import API.HTTPClient;
import Controller.HttpServletParent;
import Model.User;
import auth.SMSAuthenticator;
import auth.Secret;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
/**
 *
 * @author ksinn
 */
public class GoogleOAuth extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {  
            User user = null;
            String client_id = "1006393654499-p8mr2fj0fkg43ifvl68eo2k18o6u2qgm.apps.googleusercontent.com";
            String client_secret = "lU9JFY65Oy7Oas33THOn_CUN";
            String redirect_uri = AppInf.main+"/user/SignIn";
            String grant_type = "authorization_code";
            String code = request.getParameter("code");
            
            String url = "https://accounts.google.com/o/oauth2/token";
            String param = "client_id="+client_id
                    +"&client_secret="+client_secret
                    +"&redirect_uri="+redirect_uri
                    +"&grant_type="+grant_type
                    +"&code="+code;
            
            HTTPClient client = new HTTPClient(url, param, "POST");
            client.sendRequest();
                JSONObject requestJSON = client.getRequestJSON();
                HTTPClient client1 = new HTTPClient("https://www.googleapis.com/oauth2/v1/userinfo?access_token="+requestJSON.getString("access_token"), null, "GET");
                client1.sendRequest();
                JSONObject user_data = client1.getRequestJSON();
                String mail = user_data.getString("email");
                user = new User();
                    if(user.getByMail(mail)){
                        request.getSession().setAttribute("1s_user", user);
                        Secret secret = user.getSecondFactor();
                        if(secret!=null){
                            if("phone".equals(secret.Type)){
                                SMSAuthenticator sms = new SMSAuthenticator();
                                if(sms.sendSMS(user.getId(), secret.Secret)){
                                    
                                } else{
                                    throw new ServletException("SMS gateway is fail!");
                                }
                            }
                            request.getRequestDispatcher("VerifyCode.jsp").forward(request, response);
                            return;
                        } else {
                            response.sendRedirect("SetUp");
                            return;
                        }
                    }
                    else
                        throw new ServletException("This mail not registred in system");
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
