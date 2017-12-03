/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import Impl.TaskEntety;
import Model.StudentConnect;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class SQLTask extends TaskEntety {

    protected String answer;
    protected String question;
    protected String img;

    private SQLException exception;
    private ArrayList executeResult;

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = super._getParams();
        list.put("question", this.question);
        list.put("answer", this.answer);
        list.put("img", this.img);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> list) throws Exception {
        super._setParams(list);
        this.question = (String) list.get("question");
        this.answer = (String) list.get("answer");
        this.img = (String) list.get("img");
    }

    @Override
    protected boolean _isCorrect() {

        if (this.question == null || this.question.isEmpty()) {
            return false;
        }
        if (this.answer == null || this.answer.isEmpty()) {
            return false;
        }

        return true;
    }

    public SQLTask() {

    }

    public String getQuestion() {
        return this.question;
    }

    public String getAnswer() {
        return this.answer;
    }

    public String getImg() {
        return this.img;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswer(String answer) {
        this.answer = answer.toLowerCase();
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public boolean valid() throws Exception {
        execute();
        if (this.exception != null)
            return false;
        if (this.executeResult.size() == 0)
            return false;
        return true;
    }

    public void execute() throws NamingException, SQLException {
        StudentConnect conn = null;
        try {
            conn = new StudentConnect(((SQLTaskList) this.list).getSchema());
            if (conn.exequtQuery(this.answer)) {
                this.executeResult = conn.getResultArray();
            } else {
                this.exception = conn.getException();
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    public ArrayList getExecuteResult() {
        return this.executeResult;
    }

    public SQLException getException() {
        return this.exception;
    }

}
