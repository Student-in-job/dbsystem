/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Learning.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Delete extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        
        User user = (User) request.getSession().getAttribute("user");
        if(user==null||!user.isLogined())
            response.sendRedirect("../login.jsp");
        
        try(PrintWriter out = response.getWriter()){
            
            String param="";
            /*if(request.getParameter("program")!=null){
                
                param="program";
            }
            if(request.getParameter("material")!=null){
                
                param="material";
            }
            if(request.getParameter("test")!=null){
                
                param="test";
            }
            if(request.getParameter("test_task")!=null){
                
                param="test_task";
            }
            if(request.getParameter("task")!=null){
                
                param="task";
            }
            if(request.getParameter("user")!=null){
                
                param="user";
            }*/
            Enumeration<String> parameterNames = request.getParameterNames();
            param = parameterNames.nextElement();
            
            out.println("<!doctype html>"
                    + "<html>"
                    + "<body>"
                    + "<form method=\"post\" action=\"Delete\">"
                    + "<input type=\"hidden\" name=\"param\" value=\""+param+"\">"
                    + "<input type=\"hidden\" name=\"value\" value=\""+request.getParameter(param)+"\">"
                    + "<input type=\"submit\" value=\"Acept delete\">"
                    + "</form>"
                    + "</body>"
                    + "</html>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = (User) request.getSession().getAttribute("user");
        if(user==null||!user.isLogined())
            response.sendRedirect("../login.jsp");
        try(PrintWriter out = response.getWriter()){
        
        String param=request.getParameter("param"), value=request.getParameter("value");
        String mes="";
        int m=0;
        
            if("program".equals(param)){
                
                Program p = new Program(value);
                m = p.Delete();
            }
            if("material".equals(param)){
                
                Material p = new Material(value);
                m = p.Delete();
            }
            if("test".equals(param)){
                
                Test p = new Test(value);
                m = p.Delete();
            }
            if("testtask".equals(param)){
                
                TestTask p = new TestTask(value);
                m = p.Delete();
            }
            if("task".equals(param)){
                
                /*Task p = new Task(value);
                m = p.Delete();*/
            }
            if("user".equals(param)){
                
                /*User p = new User(value);
                m = p.Delete();*/
            }
            
        
        
        out.println(m);
        
        }
        
        
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
