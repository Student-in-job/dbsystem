/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TasKer.Exam;

import TasKer.Core.TasKer;
import TasKer.Tasks.Task;
import TasKer.Work.Work;

/**
 *
 * @author ksinn
 */
public interface Examinator  extends TasKer {
    
    public void prepareExam(Work work) throws Exception;
    
    public void continueExam(Work work) throws Exception;
    
    public Work finishExam() throws Exception;
    
    //public boolean isFinish();
    
    public CheckedAnswer check(Answer answer) throws Exception;
    
    public boolean next() throws Exception;
    
    public Task currentTask();
    
    public long spentTime();
    
    public long leftTime();
    
    public long totalTime();
    
    public String popMessage();
    
    
    
}
