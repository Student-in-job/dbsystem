/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.task;

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
        
        int id = Integer.parseInt(request.getParameter("id"));
        Model.Task task = new Model.Task();
        task.getById(id);
        if(user.getId()==task.getProgram().getUser().getId()) {
        
        PrintWriter out = response.getWriter();
        try{
            if(task._delete()){
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
        return HttpServletParent.OnlyForUnAuthorized;
    }



}
