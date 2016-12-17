/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import Controller.HttpServletParent;
import Model.User;
import auth.SecondFactor;
import auth.Secret;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class SetPhone extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
            String phone = request.getParameter("phone");
            int id = Integer.parseInt(request.getParameter("id"));
            User stud = new User();
            stud.getById(id);
            Secret secret = new Secret();
            secret.Secret=phone;
            secret.Type="phone";
            PrintWriter out = response.getWriter();
            try{
                if(SecondFactor.put2factor(id, secret))
                    out.print("ok");
                else 
                    out.print("no");
            } catch(Exception ex){
                out.print("error");
            }
    
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.ForAll;
    }

    
}
