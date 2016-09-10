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
        
        String request_path = request.getRequestURI()+"?"+request.getQueryString();
        User user = (User) request.getSession().getAttribute("user");
        if(user==null) {
            String mail=null, cpassword = null;
            Cookie[] c = request.getCookies();
            for (Cookie c1 : c) {
                if (c1.getName().equals("usermail")) {
                    mail = c1.getValue();
                    for (Cookie c2 : c) {
                        if (c2.getName().equals("password")) {
                            cpassword = c2.getValue();
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
                else {
                        request.getSession().setAttribute("rederectto", request_path);
                        response.sendRedirect(request.getServletContext().getContextPath()+"/login.jsp"); return;} 
            }
            else {
                    request.getSession().setAttribute("rederectto", request_path);
                    response.sendRedirect(request.getServletContext().getContextPath()+"/login.jsp"); return;}
        }
        
        try(PrintWriter out = response.getWriter()){
            
            
            Enumeration<String> parameterNames = request.getParameterNames();
            String param = parameterNames.nextElement();
            
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
            for (Cookie c1 : c) {
                if (c1.getName().equals("usermail")) {
                    mail = c1.getValue();
                    for (Cookie c2 : c) {
                        if (c2.getName().equals("password")) {
                            cpassword = c2.getValue();
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
        Parent pg=null;    
        try{
                if("program".equals(param)){

                    Program p = new Program(value);
                    if(user.getID()!=p.getTeacherID()) throw new IllegalAction();
                    pg=p.getTeacher();
                    p.Delete();
                }
                if("material".equals(param)){

                    Material p = new Material(value);
                    pg=p.getProgram();
                    if(user.getID()!=p.getProgram().getTeacherID()) throw new IllegalAction();
                    p.Delete();
                }
                if("test".equals(param)){

                    Test p = new Test(value);
                    if(user.getID()!=p.getProgram().getTeacherID()) throw new IllegalAction();
                    if(p.getName().equals("Exem")&&p.getDay()==p.getProgram().getDuration()) throw new IllegalAction();
                    pg=p.getProgram();
                    p.Delete();
                }
                if("testtask".equals(param)){

                    TestTask p = new TestTask(value);
                    if(user.getID()!=p.getTest().getProgram().getTeacherID()) throw new IllegalAction();
                    pg=p.getTest();
                    p.Delete();
                }
                if("files".equals(param)){

                    Files p = new Files(value);
                    if(user.getID()!=p.getMaterial().getProgram().getTeacherID()) throw new IllegalAction();
                    
                    pg=p.getMaterial();
                    p.Delete();
                }
                if("user".equals(param)){

                    User p = (User) request.getSession().getAttribute("user");
                    if(user.getID()!=p.getID()) throw new IllegalAction();
                    p.Delete();
                }
            }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
            catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
            catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
            catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
        
        if(pg==null) response.sendRedirect(request.getServletContext().getContextPath());
        switch(pg.getType()){
            case "program": {response.sendRedirect(request.getServletContext().getContextPath()+"/Course.jsp?course_id="+pg.getID()); return;}
            case "material": {response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+pg.getID()); return;}
            case "test": {response.sendRedirect(request.getServletContext().getContextPath()+"/program/Test.jsp?test="+pg.getID()); return;}
            case "user": {response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp"); return;}
            default: {response.sendRedirect(request.getServletContext().getContextPath()); return;}
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
