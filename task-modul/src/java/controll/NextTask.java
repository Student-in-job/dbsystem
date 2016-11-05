package controll;

import Model.Accept;
import Model.Work;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NextTask extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            
            Work work = new Work();
            int user_id = (int) request.getSession().getAttribute("user_id");
            boolean mark = false;
            Integer work_id = (Integer) request.getSession().getAttribute("work_id");
            if(work_id==null){
                HashMap<String, Object> param = new HashMap<String, Object>();
                param.put("user_id", user_id);
                ArrayList<HashMap<String, Object>> Params = work.getObjectsParam(param);
                for(int i=Params.size()-1; i>=0; i--){
                    work = new Work();
                    work.getFromParam(Params.get(i));
                    if(work.getTime()+work.getLiveTime()*1000 > new Date().getTime()){
                        work.ReadAcceptsFromDB();
                        work.ReadTaskGroup();
                        mark=true;
                        break;
                    }
                }
            } else {
                work = new Work(work_id);
                mark=true;
            }
            if(mark) {   
            Accept accept = work.Next();
            if(accept==null){
                response.sendRedirect("FinishWork");
                return;
            }
            request.getSession().setAttribute("accept", accept);
            request.setAttribute("task", accept.getTask());
            request.getRequestDispatcher("DoTask.jsp").forward(request, response);
            } else {
                response.sendRedirect("Start");
                return;
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
