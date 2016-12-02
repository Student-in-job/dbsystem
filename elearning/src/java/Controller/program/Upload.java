/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controller.HttpServletParent;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
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

public class Upload extends HttpServletParent {


    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int material = Integer.parseInt(request.getParameter("material"));
        String title = request.getParameter("title");
        boolean multipartContent = ServletFileUpload.isMultipartContent(request);
        if(multipartContent){
                Part part = request.getPart("data");

                    Files file = new Files(part, title);
                    file.Write(new Material(material), user);
                    response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+material);
        }
        else{
            String name = request.getParameter("file");
                    Files file = new Files(name, title);
                    file.Write(new Material(material), user);
                    response.sendRedirect(request.getServletContext().getContextPath()+"/Material.jsp?material_id="+material);
                
        }
    }

    @Override
    protected int PrivateMod() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
