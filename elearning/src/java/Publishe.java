/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DataBasePak.Log;
import DataBasePak.ObjectNotFind;
import DataBasePak.IllegalAction;
import Learning.Program;
import Learning.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Publishe extends HttpServlet {

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            String request_path = request.getRequestURI()+"?"+request.getQueryString();
            User user = (User) request.getSession().getAttribute("user");
            if(user==null) {
                String mail=null, cpassword = null;
                Cookie[] c = request.getCookies();
                if(c!=null){
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
        PrintWriter out = response.getWriter();
        try {
                int p = Integer.parseInt(request.getParameter("program"));
                Program prog = new Program(p);
                if(prog.Publish(user))
                    out.println("Program published");
                else 
                    out.println(prog.Correct());
            
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); }
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); }
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); }
    
    }    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
