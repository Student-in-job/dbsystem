/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Task;

import Controller.HttpServletParent;
import Entety.Service;
import Entety.Task;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class Edit extends HttpServletParent {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        Task task = new Task();
        task.getById(id);
        
        Service service = new Service();  
        service.getById(1);
        
        List serv = new ArrayList();
        serv.add(service);
        Map tasks = service.getTaskList(user);
        
        if (user.getId() == task.getProgram().getUser().getId()) {
            request.setAttribute("tasks", tasks);
            request.setAttribute("services", serv);
            request.setAttribute("task", task);
            request.getRequestDispatcher("task_form.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "You cannot edit this component!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }

    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        Task task = new Task();
        task.getById(id);
        if (user.getId() == task.getProgram().getUser().getId()) {

            String name = request.getParameter("name");
            int service = Integer.parseInt(request.getParameter("service"));
            int day = Integer.parseInt(request.getParameter("day"));
            int time = Integer.parseInt(request.getParameter("time"));
            int starttime = Integer.parseInt(request.getParameter("starttime"));
            int group = Integer.parseInt(request.getParameter("group"));
            int total_count = Integer.parseInt(request.getParameter("total_count"));
            int passing_count = Integer.parseInt(request.getParameter("passing_count"));
            int period = Integer.parseInt(request.getParameter("period"));

            task.setDay(day);
            task.setName(name);
            task.setTime(time);
            task.setGroupId(group);
            task.setPassingCount(passing_count);
            task.setTotalCount(total_count);
            task.setStartTime(starttime);
            task.setPeriod(period);
            task.setServiceId(service);

            if (task.Update()) {
                response.sendRedirect(request.getContextPath()+"/program/render?id="+task.getProgram().getId());
            } else {
                request.setAttribute("task", task);
                request.getRequestDispatcher("task_form.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "You cannot edit this component!");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

    @Override
    protected int PrivateMod() {
        return HttpServletParent.OnlyForAuthorized;
    }

}
