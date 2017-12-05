package TasKer.Web.Exam;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import TasKer.Exam.Examinator;
import TasKer.Web.MyServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Timer extends MyServlet {

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
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        Examinator exam = (Examinator) request.getSession().getAttribute("examinator");
        try (PrintWriter out = response.getWriter()) {            
            long t = exam.leftTime();
            if(t<0) t=0;
            out.println(t);

            
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
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
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
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        processRequest(request, response);
    }

   @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;//.OnlyForAuthorized;
    }

}
