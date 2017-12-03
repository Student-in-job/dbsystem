/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import Struct.ErrorParameterException;
import Struct.List;
import Struct.ListFactory;
import Struct.TaskFactory;
import Struct.Task;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ksinn
 */
public class SQLTaskFactory implements TaskFactory {

    ListFactory listFactory = new SQLListFactory();

    @Override
    public Task create(HttpServletRequest request) throws ErrorParameterException {
        SQLTask task = new SQLTask();
        
        Map<String, String[]> request_params = request.getParameterMap();
        
        String question = null;
        String answer = null;
        List list = null;
        int ball = 0;
        int time = 0;
        String img = request_params.getOrDefault("img", new String[]{""})[0];
        try {
            ball = Integer.parseInt(request_params.getOrDefault("ball", new String[]{"0"})[0]);
        } catch (Exception ex) {
        }
        try {
            time = Integer.parseInt(request_params.getOrDefault("time", new String[]{"0"})[0]);
        } catch (Exception ex) {
        }
        String[] questionAr = request_params.get("question");
        String[] answerAr = request_params.get("answer");
        String[] listIdAr = request_params.get("group");

        ErrorParameterException exp = null;
        if (questionAr != null) {
            question = questionAr[0];
        } else {
            exp = new ErrorParameterException("Miss parameter 'question'");
        }
        if (answerAr != null) {
            answer = answerAr[0];
        } else {
            exp = new ErrorParameterException("Miss parameter 'answer'");
        }
        if (listIdAr != null) {
            try {
                int list_id = Integer.parseInt(listIdAr[0]);
                list = listFactory.createById(list_id);
            } catch (Exception ex) {
                exp = new ErrorParameterException("Error value of parameter 'list'");
            }
        } else {
            exp = new ErrorParameterException("Miss parameter 'list'");
        }

        if (exp == null) {
            task.setList(list);
            task.setQuestion(question);
            task.setAnswer(answer);
            task.setImg(img);
            task.setBall(ball);
            task.setTime(time);
            return task;
        } else {
            throw exp;
        }
    }

    @Override
    public Task createById(int id) throws Exception {
        Task task = new SQLTask();
        task.getById(id);
        task.setList(listFactory.createById(task.getListId()));
        return task;
    }

    @Override
    public Task create() {
        return new SQLTask();
    }

    @Override
    public Task create(int list) throws Exception {
        SQLTask task = new SQLTask();
        task.setDefaultBall();
        task.setDefaultTime();
        task.setList(listFactory.createById(list));
        return task;
    }

    @Override
    public Task create(HttpServletRequest request, Task t) throws ErrorParameterException {
        SQLTask task = (SQLTask) t;
        
        Map<String, String[]> request_params = request.getParameterMap();
        
        int ball = 0;
        int time = 0;
        String img = request_params.getOrDefault("img", new String[]{task.getImg()})[0];
        String question = request_params.getOrDefault("question", new String[]{task.getQuestion()})[0];
        String answer = request_params.getOrDefault("answer", new String[]{task.getAnswer()})[0];
        try {
            ball = Integer.parseInt(request_params.get("ball")[0]);
        } catch (Exception ex) {
            ball = task.getBall();
        }
        try {
            time = Integer.parseInt(request_params.get("time")[0]);
        } catch (Exception ex) {
            time = task.getTime();
        }
        
        task.setQuestion(question);
        task.setAnswer(answer);
        task.setImg(img);
        task.setBall(ball);
        task.setTime(time);
        return task;
    }

}
