package controll;

import Model.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CheckTask extends MyServlet {

    private void Proc(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            String answer = request.getParameter("answer");
            Result accept = (Result) request.getSession().getAttribute("accept");
            if(accept==null){
                response.sendRedirect("NextTask");
                return;
            } else {
                
                if(accept.getLeftTime()<0){
                    response.sendRedirect("NextTask");
                    return;
                } else {
                    if(accept.putAnswer(answer)){
                        accept.Update();
                        if(accept.getResult()==1){
                            response.sendRedirect("NextTask?m=1");
                            return;
                        } else {
                            request.setAttribute("rs", accept.getResultArray());
                        }
                    } else {
                        request.setAttribute("error", "Error query!");
                    }
                    request.setAttribute("answer", answer);
                    request.setAttribute("task", accept.getTask());
                    request.getRequestDispatcher("DoTask.jsp").forward(request, response);
                    return;
                }
            }
            
        
    }


    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Result accept = (Result) request.getSession().getAttribute("accept");
            if(accept!=null){
                accept.setResult(0);
                accept.setTotalTime();
                accept.Update();
            }
            response.sendRedirect("NextTask");
    }


    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        this.Proc(request, response);
    }

    @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;//OnlyForAuthorized;
    }


}
