/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.task;

import Controller.HttpServletParent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Task extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Model.Task task = new Model.Task();
        task.getById(id);
        if(user.getId()==task.getProgram().getUser().getId()) {
            request.setAttribute("task", task);
            request.getRequestDispatcher("TaskDataRender.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "You cannot see this component!");
            request.getRequestDispatcher("/Message.jsp").forward(request, response);    
        }
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
