/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TasKer.Exam.Impl;

import TasKer.Exam.Answer;
import TasKer.Exam.Attempt;
import TasKer.Exam.CheckedAnswer;
import TasKer.Exam.Result;


/**
 *
 * @author ksinn
 */
public abstract class SimpleCheckedAnswer implements CheckedAnswer{

   private boolean accept;
   private Answer answer;
   
   public SimpleCheckedAnswer(boolean accept, Answer answer){
       this.accept = accept;
       this.answer = answer;
   }
   
   @Override
   public Answer getAnswer(){
       return answer;
   }
    
    @Override
    public Result getResult() {
        Result result = new ResultEntety();
        result.setTaskId(answer.getTask().getId());
        if(isAccept()){
            result.setMark(answer.getTask().getBall());
        } else {
            result.setMark(0);
        }
        return result;
    }
    
    @Override
    public Attempt getAttempt() {
        Attempt attempt = new AttemptEntety();
        attempt.setAnswer(answer.toString());
        attempt.setFlag(accept?1:0);
        attempt.setTaskId(answer.getTask().getId());
        return attempt;
    }

    @Override
    public boolean isAccept() {
        return accept;
    }
    
}
