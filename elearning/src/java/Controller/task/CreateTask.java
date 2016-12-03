/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.task;

import Controller.HttpServletParent;
import Model.Program;
import Model.Task;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class CreateTask extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int program = Integer.parseInt(request.getParameter("program"));
        Program pg = new Program();
        pg.getById(program);
        if(user.getId()==pg.getUser().getId()) {
            request.setAttribute("program", pg);
            request.getRequestDispatcher("TaskDataForm.jsp").forward(request, response);
        } else {
            throw new Exception("You cannot");
        }

    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        int program = Integer.parseInt(request.getParameter("program"));
        Program pg = new Program();
        pg.getById(program);
        if(user.getId()==pg.getUser().getId()) {
        
        String name = request.getParameter("name");
        int day = Integer.parseInt(request.getParameter("day"));
        int time = Integer.parseInt(request.getParameter("time"));
        int starttime = Integer.parseInt(request.getParameter("starttime"));
        int group = Integer.parseInt(request.getParameter("group"));
        int total_count = Integer.parseInt(request.getParameter("total_count"));
        int passing_count = Integer.parseInt(request.getParameter("passing_count"));
        int period = Integer.parseInt(request.getParameter("period"));

        Task task = new Task();
        
        task.setDay(day);
        task.setName(name);
        task.setProgram(day);
        task.setTime(time);
        task.setGroupId(group);
        task.setPassingCount(passing_count);
        task.setTotalCount(total_count);
        task.setStartTime(starttime);
        task.setPeriod(period);
        
        if(task.Write(user))
            response.sendRedirect("Task?id="+task.getId());
        else {
            request.setAttribute("task", task);
            request.setAttribute("program", pg);
            request.getRequestDispatcher("TaskDataForm.jsp").forward(request, response);
        }
        } else {
            throw new Exception("You cannot");
        }
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

    
}
