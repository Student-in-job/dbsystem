/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DataBasePak.Log;
import DataBasePak.ObjectNotFind;
import DataBasePak.InvalidParameter;
import DataBasePak.IllegalAction;
import Learning.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Delete extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = (User) request.getSession().getAttribute("user");
        if(user==null) {
            String mail=null, cpassword = null;
            Cookie[] c = request.getCookies();
            for(int i=0; i<c.length; i++){
                if(c[i].getName().equals("usermail")){
                    mail = c[i].getValue();
                    for(int j=0; j<c.length; j++){
                        if(c[j].getName().equals("password")){
                            cpassword = c[j].getValue();
                            break;
                        }
                    }
                    break;
                }
            }
            if(mail!=null&&cpassword!=null){



                user = new User(mail, cpassword);
                boolean a=false;
                try{
                    a = user.Authorize();
                }catch(Exception ex){Log.getOut(ex.getMessage());}
                if(a){
                    request.getSession().setAttribute("user", user);
                }
                else {response.sendRedirect(request.getServletContext().getContextPath()+"/login.jsp"); return;} 
            }
            else {response.sendRedirect(request.getServletContext().getContextPath()+"/login.jsp"); return;}
        }
        
        try(PrintWriter out = response.getWriter()){
            
            String param="";
            
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
        if(user==null) {
            String mail=null, cpassword = null;
            Cookie[] c = request.getCookies();
            for(int i=0; i<c.length; i++){
                if(c[i].getName().equals("usermail")){
                    mail = c[i].getValue();
                    for(int j=0; j<c.length; j++){
                        if(c[j].getName().equals("password")){
                            cpassword = c[j].getValue();
                            break;
                        }
                    }
                    break;
                }
            }
            if(mail!=null&&cpassword!=null){



                user = new User(mail, cpassword);
                boolean a=false;
                try{
                    a = user.Authorize();
                }catch(Exception ex){Log.getOut(ex.getMessage());}
                if(a){
                    request.getSession().setAttribute("user", user);
                }
                else {response.sendRedirect(request.getServletContext().getContextPath()+"/login.jsp"); return;} 
            }
            else {response.sendRedirect(request.getServletContext().getContextPath()+"/login.jsp"); return;}
        }
        
        String param=request.getParameter("param"); int value=Integer.parseInt(request.getParameter("value"));
            try{
                if("program".equals(param)){

                    Program p = new Program(value);
                    p.Delete();
                }
                if("material".equals(param)){

                    Material p = new Material(value);
                    p.Delete();
                }
                if("test".equals(param)){

                    Test p = new Test(value);
                    p.Delete();
                }
                if("testtask".equals(param)){

                    TestTask p = new TestTask(value);
                    p.Delete();
                }
                if("files".equals(param)){

                    Files p = new Files(value);
                    p.Delete();
                }
                if("user".equals(param)){

                    User p = (User) request.getSession().getAttribute("user");
                    p.Delete();
                }
            }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=IllegalAction"); return;}
            catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=ObjectNotFind"); return;}
            catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp?e=InvalidParameter"); return;} 
            catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}

        response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp");
        
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
