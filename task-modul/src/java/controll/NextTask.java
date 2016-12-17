package controll;

import Model.Accept;
import Model.Work;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NextTask extends MyServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            
        
            Work work = new Work();
            boolean mark = false;
            Integer work_id = (Integer) request.getSession().getAttribute("work_id");
            if(work_id==null){
                HashMap<String, Object> param = new HashMap<String, Object>();
                param.put("user_id", user_id);
                param.put("Date(times)", "Date(now())");
                ArrayList<HashMap<String, Object>> Params = work.getObjectsParam(param);
                for(int i=Params.size()-1; i>=0; i--){
                    work = new Work();
                    work.getFromParam(Params.get(i));
                    if(work.getCreateTime()+work.getLiveTime()*1000 > new Date().getTime()){
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
            if("1".equals(request.getParameter("m")))
                request.setAttribute("error", "Query pass!");
            request.getRequestDispatcher("DoTask.jsp").forward(request, response);
            return;
            } else {
                response.sendRedirect("Start");
                return;
            }
    }

    
    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        processRequest(request, response);
    }

    
    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        processRequest(request, response);
    }

    
    @Override
    protected int PrivateMod() {
        return MyServlet.OnlyForAuthorized;
    }

}
