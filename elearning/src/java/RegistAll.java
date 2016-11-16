/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Learning.*;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author ksinn
 */

@WebServlet("/admin/RegistAll")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*100,      // 10MB
                 maxRequestSize=1024*1024*150)   // 50MB

public class RegistAll extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        int i=0;
            
        
                String data = request.getParameter("data");
                
                String[] b = data.split("\n");
                for(int j=0; j<b.length; j++){
                    String[] d = b[j].split(" ");
                    User user = new User(d[2], d[0]+"123"+d[1], d[0], d[1], new Date(0), "s");
                    try {
                        user.Register(null);
                    } catch (Exception ex) {
                        i++;
                    }
                }
                
        response.getWriter().print(i);
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
