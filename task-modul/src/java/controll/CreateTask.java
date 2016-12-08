package controll;

import Model.StudentConnect;
import Model.Task;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateTask extends MyServlet {


    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        int group;
            group = Integer.parseInt(request.getParameter("group"));
        Task new_task = new Task();
            new_task.setGroup(group);
        
        request.setAttribute("task", new_task);
        request.getRequestDispatcher("Task.jsp").forward(request, response);
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        request.setCharacterEncoding("UTF-8");
        
        int group = Integer.parseInt(request.getParameter("group"));
        
        Task new_task = new Task();
        
        new_task.setGroup(group);
        new_task.setAnswer(request.getParameter("answer"));
        new_task.setImg(request.getParameter("img"));
        new_task.setQuestion(request.getParameter("question"));
        try{
            new_task.setTime(Integer.parseInt(request.getParameter("time")));
        } catch(Exception ex) {
        }
        try{
            new_task.setBall(Integer.parseInt(request.getParameter("ball")));
        } catch(Exception ex) {
        }
        
        boolean res;
            
            StudentConnect cheker = null;
            boolean good_query=false;
            try{
                cheker = new StudentConnect();
                good_query = cheker.exequtQuery(new_task.getAnswer());
            } finally {
                if(cheker!=null)
                    cheker.close();
            }
            if(good_query){
                res = new_task.Write(user_id);

                if(res){
                    response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Task?task="+new_task.getId()); 
                    return;
                } else {
                    request.setAttribute("task", new_task);
                    request.getRequestDispatcher("Task.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("task", new_task);
                request.setAttribute("error", "Error code: "+cheker.getException().getErrorCode()+ ". " + cheker.getException().getMessage());
                request.getRequestDispatcher("Task.jsp").forward(request, response);
                return;
            }
        

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }
}
