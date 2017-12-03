/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Struct.d;

import Struct.TasKer;
import Struct.Task;
import Struct.Work;

/**
 *
 * @author ksinn
 */
public interface Examinator  extends TasKer {
    
    public void prepareExam(Work work) throws Exception;
    
    public void continueExam(Work work) throws Exception;
    
    public CheckedAnswer check(Answer answer) throws Exception;
    
    public boolean next();
    
    public Task currentTask();
    
    public long spentTime();
    
    public long laftTime();
    
    public long totalTime();
    
    
    
}
