/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Task;

import Controller.HttpServletParent;
import Entety.Task;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
        if (user.getId() == task.getCourse().getUser().getId()) {
            request.setAttribute("task", task);
            request.setAttribute("course", task.getCourse());
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
        if (user.getId() == task.getCourse().getUser().getId()) {

            String name = request.getParameter("name");
            int service = Integer.parseInt(request.getParameter("service"));
            int group = Integer.parseInt(request.getParameter("group"));
            int count = Integer.parseInt(request.getParameter("total_count"));
            String endTime = request.getParameter("end_time");
            String startTime = request.getParameter("start_time");
            String endDate = request.getParameter("end_date");
            String startDate = request.getParameter("start_date");
            String startStr = startDate + " " + startTime;
            String endStr = endDate + " " + endTime;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Timestamp start = new Timestamp(dateFormat.parse(startStr).getTime());
            Timestamp end = new Timestamp(dateFormat.parse(endStr).getTime());

            task.setName(name);
            task.setListId(group);
            task.setCount(count);
            task.setServiceId(service);
            task.setTimeRange(start, end);

            if (task.Update()) {
                response.sendRedirect(request.getContextPath() + "/course/render?id=" + task.getCourse().getId());
            } else {
                request.setAttribute("task", task);
                request.setAttribute("course", task.getCourse());
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
