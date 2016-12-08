package controll;


import Model.StudentConnect;
import Model.Task;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EditTask extends MyServlet {


    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

            
            int task;
            Task new_task = new Task();
            
            try{
                task = Integer.parseInt(request.getParameter("task"));
                new_task.getById(task);
            } catch (Exception ex){
                throw new ServletException(ex);
            }
            
            if(user_id==new_task.getGroup().getOwner()){
                request.setAttribute("task", new_task);
                request.getRequestDispatcher("Task.jsp").forward(request, response);
            } else 
               throw new ServletException("You cannot see this page!");
    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
                
        request.setCharacterEncoding("UTF-8");
            
            int task=Integer.parseInt(request.getParameter("task"));
            Task new_task = new Task();
            try {
                new_task.getById(task);
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
            if(user_id==new_task.getGroup().getOwner()){
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
                    boolean good_query=false;
                    try{
                        good_query = cheker.exequtQuery(new_task.getAnswer());
                    } finally {
                        cheker.close();
                    }
                    
                    if(good_query){
                        res = new_task.Update(user_id);

                        if(res){
                            response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Task?task="+new_task.getId()); 
                            return;
                        } else {
                            request.setAttribute("task", new_task);
                            response.sendRedirect(request.getServletContext().getContextPath()+"/owner/Task?task="+new_task.getId()); 
                            return;
                        } 
                    } else {
                        request.setAttribute("task", new_task);
                        request.setAttribute("error", "Error code: "+cheker.getException().getErrorCode()+ ". " + cheker.getException().getMessage());
                        request.getRequestDispatcher("Task.jsp").forward(request, response);
                        return;
                    }

                } catch(Exception ex){
                    throw new ServletException(ex);
                }
            } else 
                throw new ServletException("You cannot see this page!");

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
