package controll;

import Model.Accept;
import Model.Work;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NextTask extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String work_id = request.getParameter("work_id");
            if(work_id==null){
                throw new Exception();
            } else {
                Work work = new Work(Integer.parseInt(work_id));
                Accept accept = work.getAccept();
                request.getSession().setAttribute("accept", accept);
                request.getRequestDispatcher("DoTask.jsp").forward(request, response);
            }
        } catch(Exception ex){
            throw new ServletException(ex);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
