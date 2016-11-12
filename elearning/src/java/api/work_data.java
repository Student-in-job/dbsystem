/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import API.AppInf;
import API.WorkJWT;
import Learning.AcceptTask;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            String res = wt.getJson(accept, AppInf.main);
            PrintWriter out = response.getWriter();
            out.write(res);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
        

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UUID key = UUID.fromString(request.getParameter("work_key"));
            AcceptTask accept = new AcceptTask(key);
            WorkJWT wt = new WorkJWT();
            String res = wt.getJson(accept, AppInf.main);
            PrintWriter out = response.getWriter();
            out.write(res);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
