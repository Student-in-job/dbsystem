package Controller.user;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
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

public class RegistManyUser extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
            
        
                String data = request.getParameter("data");
                
                String[] b = data.split("\n");
                for(int j=0; j<b.length; j++){
                    String[] d = b[j].split(" ");
                    User user = new User();
                    user.setMail(d[2]);
                    user.setSurname(d[0]);
                    user.setName(d[1]);
                    try{
                        user.setGender(d[3]);
                    } catch (Exception ex){
                        user.setGender("m");
                    }
                    try {
                        user.Register();
                        out.write(d[2]+" is write\n");
                    } catch (Exception ex) {
                       out.write(d[2]+" is not write. Ex:"+ex.getMessage()+"\n");
                    }
                }
                
        
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
