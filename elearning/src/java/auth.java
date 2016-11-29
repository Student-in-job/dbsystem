/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import API.AppInf;
import API.HTTPClient;
import Learning.User;
import java.io.IOException;
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
        
        try{    
            User user = null;
            String client_id = "1006393654499-p8mr2fj0fkg43ifvl68eo2k18o6u2qgm.apps.googleusercontent.com";
            String client_secret = "lU9JFY65Oy7Oas33THOn_CUN";
            String redirect_uri = AppInf.main+"/auth";
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
                if(user.AuthorizeGoogle()){
                    request.getSession().setAttribute("1s_user", user);
                    Secret key = SecondFactor.get2factor(user.getID(), "key");
                    if(key!=null){
                        request.getSession().setAttribute("type", "key");
                        request.getRequestDispatcher("authKey.jsp").forward(request, response);
                        return;
                    } else {
                        response.sendRedirect("SetUp2factor.jsp");
                        return;
                    }
                }
                        
            } catch (JSONException ex) {
                throw new ServletException(ex);
            }
            
            
               
            response.sendRedirect(request.getContextPath());
        } catch (Exception ex){
            throw new ServletException(ex);
        }
        
        
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
