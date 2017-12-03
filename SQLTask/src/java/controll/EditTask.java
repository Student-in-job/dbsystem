package controll;


import static Struct.TasKer.getTaskFactory;
import Struct.Task;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditTask extends MyServlet {

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int id = Integer.parseInt(request.getParameter("task"));
        Task task = getTaskFactory().createById(id);
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

        int id = Integer.parseInt(request.getParameter("task"));
        Task task = getTaskFactory().createById(id);
        if (task.getList().getUserId() == user_id) {
            task = getTaskFactory().create(request, task);
            if (task.valid()) {
                if (task.update()) {
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
