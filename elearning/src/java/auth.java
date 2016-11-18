/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import API.HTTPClient;
import Learning.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;
import auth.*;
/**
 *
 * @author ksinn
 */
public class auth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            User user = null;
            String client_id = "1006393654499-p8mr2fj0fkg43ifvl68eo2k18o6u2qgm.apps.googleusercontent.com";
            String client_secret = "lU9JFY65Oy7Oas33THOn_CUN";
            String redirect_uri = "http://localhost:8084/elearningzz/auth";
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
            try {
                JSONObject requestJSON = client.getRequestJSON();
                HTTPClient client1 = new HTTPClient("https://www.googleapis.com/oauth2/v1/userinfo?access_token="+requestJSON.getString("access_token"), null, "GET");
                client1.sendRequest();
                JSONObject user_data = client1.getRequestJSON();
                String mail = user_data.getString("email");
                user = new User(mail);
                if(user.AuthorizeGoogle())
                    request.getSession().setAttribute("1s_user", user);
                    if(GoogleAuthenticator.getSecretKey(user.getID())!=null){
                        response.sendRedirect("authKey.jsp");
                        return;
                    } else {
                        response.sendRedirect("SetUp.jsp");
                        return;
                    }
                        
            } catch (JSONException ex) {
                Logger.getLogger(auth.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            /*String mail="ksinnD@gmail.com";
                User user = new User(mail);
                if(user.AuthorizeGoogle())
                    request.getSession().setAttribute("user", user); 
             */   
            response.sendRedirect("/elearningzz");
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
