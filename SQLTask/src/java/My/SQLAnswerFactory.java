/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package My;

import Struct.d.Answer;
import Struct.d.AnswerFactory;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ksinn
 */
public class SQLAnswerFactory implements AnswerFactory{

    @Override
    public Answer create(HttpServletRequest request) {
        SQLAnswer answer = new SQLAnswer(); 
        answer.setQuery(request.getParameter("answer"));
        return answer;
    }
    
}
