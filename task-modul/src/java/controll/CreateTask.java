package controll;

import Model.Log;
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
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }
        Task new_task = new Task();
        try {
            new_task.setGroup(group);
        } catch (Exception ex) {
            response.sendRedirect("CreateGroup"); 
            return;
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
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }
        
        Task new_task = new Task();
        
        try {
            new_task.setGroup(group);
        } catch (Exception ex) {
            response.sendRedirect("CreateGroup"); 
            return;
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
            res = new_task.Write(1);

            if(res){
                response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Task?task="+new_task.getId()); 
                return;
            } else {
                request.setAttribute("task", new_task);
                request.getRequestDispatcher("Task.jsp").forward(request, response);
                return;
            }
        } catch(Exception ex){
            Log.Write(ex.getLocalizedMessage());
            response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); 
            return;
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
