package TasKer.Web.Exam;

import static TasKer.Core.TasKer.getAnswerFactory;
import TasKer.Exam.Answer;
import TasKer.Exam.CheckedAnswer;
import TasKer.Exam.Examinator;
import TasKer.Web.MyServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoExam extends MyServlet {

    private static final String view = "do.jsp";

    @Override
    protected void doMyGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Examinator exam = (Examinator) request.getSession().getAttribute("examinator");
        if(exam==null) throw new Exception("error session");
        Answer answer = getAnswerFactory().create();
        answer.setTask(exam.currentTask());
        request.setAttribute("answer", answer);
        request.getRequestDispatcher(view).forward(request, response);

    }

    @Override
    protected void doMyPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Examinator exam = (Examinator) request.getSession().getAttribute("examinator");
        Answer answer = getAnswerFactory().create(request);
        answer.setTask(exam.currentTask());

        CheckedAnswer checkedAnswer = exam.check(answer);
        if (checkedAnswer.isAccept()) {
            if (exam.next()) {
                response.sendRedirect(request.getContextPath() + "/exam/do");
            } else {
                response.sendRedirect(request.getContextPath() + "/exam/finish");
            }
        } else {
            request.setAttribute("answer", answer);
            request.setAttribute("checkedAnswer", checkedAnswer);
            request.getRequestDispatcher(view).forward(request, response);
        }

    }

    @Override
    protected int PrivateMod() {
        return MyServlet.ForAll;// OnlyForAuthorized;
    }

}
