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
public class Delete extends HttpServletParent {

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
        int id = 0;
        id = Integer.parseInt(request.getParameter("id"));
        Model.Program program = new Model.Program();
        program.getById(id);
        if(user.getId()==program.getUser().getId()){
        
        PrintWriter out = response.getWriter();
        try{
            if(program._delete()){
                out.write("ok");
            } else {
                out.write("no");
            }
        } catch (Exception ex){
            out.write("error");
        }
        out.flush();
        out.close();
        } else 
            throw new Exception("You cannot");
    
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
