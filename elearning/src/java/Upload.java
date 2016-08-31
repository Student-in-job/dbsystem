/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DataBasePak.*;
import Learning.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ksinn
 */

@WebServlet("/program/Upload")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*100,      // 10MB
                 maxRequestSize=1024*1024*150)   // 50MB

public class Upload extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String request_path = request.getRequestURI()+"?"+request.getQueryString();

    
        User user = (User) request.getSession().getAttribute("user");
        if(user==null) {
            String mail=null, cpassword = null;
            Cookie[] c = request.getCookies();
            if(c!=null){
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
            
        int material = Integer.parseInt(request.getParameter("material"));
        String title = request.getParameter("title");
        
        boolean multipartContent = ServletFileUpload.isMultipartContent(request);
        if(multipartContent){
                Part part = request.getPart("data");
                try{
                    Files file = new Files(part, title);
                    file.Write(new Material(material), user);
                    response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+material);
                    return;
                }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
                catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;} 
                catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IOExtension"); return;} 
                catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
                catch (Exception ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;} 
        }
        else{
            String name = request.getParameter("file");
                try{
                    Files file = new Files(name, title);
                    file.Write(new Material(material), user);
                    response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+material);
                    return;
                }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
                catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;} 
                catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IOExtension"); return;} 
                catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
                catch (Exception ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;} 
       
        }
        
        
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
