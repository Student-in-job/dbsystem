package Controller.program;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controller.HttpServletParent;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Publishe extends HttpServletParent {

    
    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        PrintWriter out = response.getWriter();
        try{
                int id = Integer.parseInt(request.getParameter("id"));
                Model.Program prog = new Model.Program();
                prog.getById(id);
                if(prog.Publish(user))
                    out.println("Completed");
                else 
                    out.println("Dont completed");
        } catch(Exception ex){
            out.println("Error");
        }
            
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
