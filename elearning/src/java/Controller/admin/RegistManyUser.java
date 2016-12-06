package Controller.admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Controller.HttpServletParent;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author ksinn
 */

@WebServlet("/admin/RegistAll")

public class RegistManyUser extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        request.getRequestDispatcher("RegistAll.jsp").forward(request, response);
        
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        PrintWriter out = response.getWriter();
            
        
                String data = request.getParameter("data");
                
                data = data.replaceAll("\n", "");
                
                String[] b = data.split(";");
                for(int j=0; j<b.length; j++){
                    String[] d = b[j].split("\\+");
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
                out.flush();
                out.close();
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.ForAll;
    }

}
