
package controll;

import API.AppInf;
import API.HTTPClient;
import API.MarkSWT;
import Model.Work;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinishWork extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String error="";
        int user_id = (int) request.getSession().getAttribute("user_id");
        Integer work_id = (Integer) request.getSession().getAttribute("work_id");
        Work work = new Work();
        try{
            if(work_id==null){
                    HashMap<String, Object> param = new HashMap<String, Object>();
                    param.put("user_id", user_id);
                    param.put("Date(times)", "Date(now())");

                    ArrayList<HashMap<String, Object>> Params = work.getObjectsParam(param);
                    if(!Params.isEmpty()){
                        work = new Work();
                        work.getFromParam(Params.get(0));
                        work.ReadAcceptsFromDB();
                        work.ReadTaskGroup();
                    }
                } else {
                    work = new Work(work_id);
                }
            MarkSWT tok = new MarkSWT();
            tok.putData(work, AppInf.task, AppInf.main, System.currentTimeMillis()+60*1000*5);
            HTTPClient client = new HTTPClient(AppInf.main+"/api/work_result?"+tok.getURLParam(), null, "GET");
            client.sendRequest();
            String res = client.getRequestText().substring(0, client.getRequestText().length()-1);
            if(!"1".equals(res)){
                error = "Error whith connect. Sed to you teach.";
            }
        } catch(Exception ex){
            throw new ServletException(ex);
        }
            request.setAttribute("error", error);
            request.getRequestDispatcher("FinishTask.jsp").forward(request, response);
        
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
