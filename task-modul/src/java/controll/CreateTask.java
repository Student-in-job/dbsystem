package controll;

import Model.StudentConnect;
import Model.Task;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateTask extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int group;
        try{
            group = Integer.parseInt(request.getParameter("group"));
        } catch (Exception ex){
            throw new ServletException(ex);
        }
        Task new_task = new Task();
        try {
            new_task.setGroup(group);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
        
        request.setAttribute("task", new_task);
        request.getRequestDispatcher("Task.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        request.setCharacterEncoding("UTF-8");
        
        int group;
        try{
            group = Integer.parseInt(request.getParameter("group"));
        } catch (Exception ex){
            throw new ServletException(ex);
        }
        
        Task new_task = new Task();
        
        try {
            new_task.setGroup(group);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
        
        new_task.setAnswer(request.getParameter("answer"));
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
        try{
            
            StudentConnect cheker = new StudentConnect();
            boolean good_query = cheker.exequtQuery(new_task.getAnswer());
            if(good_query){
                res = new_task.Write(1);

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
                request.setAttribute("error", "Error code: "+cheker.gerException().getErrorCode()+ ". " + cheker.gerException().getMessage());
                request.getRequestDispatcher("Task.jsp").forward(request, response);
                return;
            }
        } catch(Exception ex){
            throw new ServletException(ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
