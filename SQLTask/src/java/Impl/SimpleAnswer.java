/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Impl;


import Struct.Task;
import Struct.d.Answer;

/**
 *
 * @author ksinn
 */
public abstract class SimpleAnswer implements Answer{
    
    protected Task task;
        

    @Override
    public Task getTask() {
        return task;
    }
    
    @Override
    public void setTask(Task task) {
        if(valid(task))
            this.task=  task;
    }
    
}
