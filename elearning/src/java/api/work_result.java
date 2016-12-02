/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import API.MarkSWT;
import Model.AcceptTask;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class work_result extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet work_result :: ${initParam.SiteName} &mdash; 2016 </title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet work_result at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AcceptTask accept = new AcceptTask();
        MarkSWT wt = new MarkSWT();
        if(wt.getDataFromRequest(request.getParameterMap(), accept)){
            try {
                accept.getByKey();
                accept.putMark(Integer.parseInt(request.getParameter("result")));        
                        
            } catch (Exception ex) {
               response.getWriter().println("0");
            }
            
            
        }
        response.getWriter().println("1");
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
