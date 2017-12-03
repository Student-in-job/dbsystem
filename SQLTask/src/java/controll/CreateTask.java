package controll;

import static Struct.TasKer.getTaskFactory;
import Struct.Task;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateTask extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int list = Integer.parseInt(request.getParameter("group"));
        Task task = getTaskFactory().create(list);
        if (task.getList().getUserId() == user_id) {
            request.setAttribute("task", task);
            request.getRequestDispatcher("Task.jsp").forward(request, response);
        } else {
            throw new Exception("You can not do this");
        }
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Task task = getTaskFactory().create(request);
        if (task.getList().getUserId() == user_id) {
            if (task.valid()) {
                if (task.save()) {
                    response.sendRedirect(request.getServletContext().getContextPath() + "/owner/Task?task=" + task.getId());
                } else {
                    request.setAttribute("task", task);
                    request.getRequestDispatcher("Task.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("task", task);
                request.setAttribute("error", "Invalid task");
                request.getRequestDispatcher("Task.jsp").forward(request, response);
            }
        } else {
            throw new Exception("You can not do this");
        }

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }
    
    

}
