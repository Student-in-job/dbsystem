package controll;

import Model.Accept;
import Model.Work;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DoTask extends HttpServlet {

    private void Proc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            Accept accept = ((Work) request.getSession().getAttribute("work")).getAccept();
            if(accept==null){
                response.sendRedirect("FinishWork");
            } else {
                String answer = request.getParameter("answer");
                if(accept.putAnswer(answer)){
                    if(accept.getResult()==1){
                        accept.Write();
                        accept = ((Work) request.getSession().getAttribute("work")).getAccept();
                    } else {
                        request.setAttribute("rs", accept.getResultArray());
                    }
                } else{
                    request.setAttribute("error", accept.getException().getMessage());
                }
                request.setAttribute("answer", answer);
                request.setAttribute("task", accept.getTask());
                request.getRequestDispatcher("DoTask.jsp").forward(request, response);
            }
        } catch(Exception ex){
            throw new ServletException(ex);
        }
            
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.Proc(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.Proc(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
