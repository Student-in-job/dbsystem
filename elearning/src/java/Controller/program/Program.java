/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.program;

import Controller.HttpServletParent;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Program extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        boolean admin = false, owner=true, student=false;

        int id = 0;
        id = Integer.parseInt(request.getParameter("id"));
        Model.Program program = new Model.Program();
        program.getById(id);
                
        admin = !program.isPublished()&&user.getId()==program.getUser().getId();
        owner = program.isPublished()&&user.getId()==program.getUser().getId();
        student = program.isPublished()&&user.getId()!=program.getUser().getId();

        ArrayList materials = program.getMaterials();
        ArrayList tests = program.getTests();
        ArrayList tasks = program.getTasks();
       
       
        request.setAttribute("admin", admin);
        request.setAttribute("owner", owner);
        request.setAttribute("student", student);
        request.setAttribute("program", program);
        request.setAttribute("tasks", tasks);
        request.setAttribute("testa", tests);
        request.setAttribute("materials", materials);

        request.getRequestDispatcher("ProgramDataRender.jsp").forward(request, response);
        return;
       
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        this.doMyGet(request, response);
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.ForAll;
    }

    
}
