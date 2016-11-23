/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class smsgetway extends HttpServlet {

    
    protected void processRequest(HttpServletResponse response, boolean status)
            throws ServletException, IOException {
        response.setContentType("text/plan;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println(status?"ok":"no");
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String text = request.getParameter("text");
        String[] cmd = new String[]{
        "sh", 
        "/home/ksinn/1.sh", 
        "/home/ksinn/key.txt",
        "'" + new Date().toString() + " " + phone + ": " + text+"\n'",
        };
      try {
          Process proc = Runtime.getRuntime().exec(cmd);
          processRequest(response, true);
      } catch (IOException ex) {
          processRequest(response, false);
      }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
