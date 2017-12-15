/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Auth.GoogleAuthenticator;
import Entety.User;
import Service.UserService;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
@WebServlet(name = "CurrentPasswords", urlPatterns = {"/admin/passwords"})
public class CurrentPasswords extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            UserService userService = new UserService();
            Iterator<User> users = userService.getUsers().iterator();
            HashMap<User, String> pass = new HashMap<User, String>();
            while(users.hasNext()){
                User next = users.next();
                String key = String.valueOf(userService.getCurrentCode(next));
                pass.put(next, key);
            }
            long d = GoogleAuthenticator.liveTime;
            long s = d*((System.currentTimeMillis()/1000L)/d);
            long e = (s + d)*1000L;
            
            request.setAttribute("users", pass);
            request.setAttribute("generateTime", new Date(e));
            request.getRequestDispatcher("passwords.jsp").forward(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
