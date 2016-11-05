/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import API.WorkJWT;
import Learning.Accept;
import Learning.AcceptTask;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author ksinn
 */
public class work_data extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UUID key = UUID.fromString(request.getParameter("work_key"));
            AcceptTask accept = new AcceptTask(key);
            WorkJWT wt = new WorkJWT();
            JSONObject json = wt.getJson(accept);
            PrintWriter out = response.getWriter();
            out.write(json.toString());
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
