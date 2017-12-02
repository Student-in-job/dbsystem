/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Task;

import API.UserSWT;
import Controller.HttpServletParent;
import Entety.Service;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Create extends HttpServletParent {

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
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String myURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
            Service service = new Service();
            service.getById(1);
            UserSWT wt = new UserSWT(service.getMyKey());
            wt.putData(user, myURL, service.getEnterStartPointURL(), System.currentTimeMillis() + 5 * 60 * 1000);
            response.setHeader("Location", service.getEnterStartPointURL() + "?" + wt.getURLParam());
            response.setHeader("Cache-Control", "no-store");
            response.setStatus(301);
        } catch (Exception ex) {
            Logger.getLogger(Create.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


}
