/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import TasKer.Core.TaskConnection;
import TasKer.Core.UserSQLException;
import TasKer.Exam.Answer;
import TasKer.Exam.CheckedAnswer;
import TasKer.Exam.Checker;
import TasKer.Core.InvalidAnswer;
import TasKer.Core.InvalidTask;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class SQLChecker implements Checker {

    private SQLException exeption;
    private ArrayList resultArray;

    @Override
    public CheckedAnswer check(Answer answ) throws Exception {
        if (valid(answ)) {
            SQLAnswer answer = (SQLAnswer) answ;
            SQLTask task = (SQLTask) answer.getTask();
            if (task.valid()) {
                SQLCheckedAnswer chekedAnswer;
                int executed = compear(((SQLTaskList) task.getList()).getSchema(), task.getAnswer(), answer.getQuery());
                chekedAnswer = new SQLCheckedAnswer(executed == 1, answer);
                chekedAnswer.setException(exeption);
                chekedAnswer.setResultArray(resultArray);
                return chekedAnswer;
            } else {
                throw new InvalidTask(task.getException());
            }
        } else {
            throw new InvalidAnswer();
        }
    }

    @Override
    public boolean valid(Answer answer) {
        return answer instanceof SQLAnswer;
    }

    private int compear(String schema, String answerQuery, String userQuery) throws NamingException, UserSQLException, SQLException {
        String sql = "((" + answerQuery + ") except (" + userQuery + ")) union ((" + userQuery + ") except (" + answerQuery + "))";
        try {
            ArrayList list = execute(schema, sql);
            this.resultArray = execute(schema, userQuery);
            return list.isEmpty()?1:0;
        } catch (UserSQLException ex) {
            try{
                this.resultArray = execute(schema, userQuery);
                return 0;
            } catch(UserSQLException e){
                this.exeption = e;
                return -1;
            }
        }

    }

    private ArrayList execute(String schema, String query) throws NamingException, UserSQLException, SQLException {
        TaskConnection conn = new TaskConnection(schema);
        return conn.exequtQuery(query);

    }

}
