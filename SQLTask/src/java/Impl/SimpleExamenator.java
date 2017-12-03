/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Impl;

import Struct.Attempt;
import Struct.Result;
import static Struct.TasKer.getChecker;
import static Struct.TasKer.getExamTasksGenerator;
import Struct.Task;
import Struct.Work;
import Struct.d.Answer;
import Struct.d.CheckedAnswer;
import Struct.d.Examinator;
import Struct.d.InvalidAnswer;
import java.util.ArrayList;

/**
 *
 * @author ksinn
 */
public class SimpleExamenator implements Examinator {

   private boolean SAVE_ATTEMPT = false;

    private long startTime;
    private long endTime;
    private long timeOfPass;
    private Work work;
    private ArrayList<Task> examTasks;
    private int currentTaskIndex;

    private boolean takeNext;
    
    @Override
    public void prepareExam(Work work) throws Exception{
        this.work = work;
        examTasks = getExamTasksGenerator().generate(work, work.getList(), work.getCount());    
    }
    
    @Override
    public void continueExam(Work work) throws Exception{
        this.work = work;
        Result result = new ResultEntety();
        ArrayList<Result> results = result.getResultsByWork(work.getId());
        examTasks = getExamTasksGenerator().regenerate(work, work.getList(), work.getCount(), results);    
    }

    @Override
    public CheckedAnswer check(Answer answer) throws Exception {
        long time = System.currentTimeMillis();
        if (getChecker().valid(answer)) {
            CheckedAnswer checkedAnswer = getChecker().check(answer);
            saveResult(checkedAnswer);
            if (checkedAnswer.isAccept()) {
                timeOfPass = System.currentTimeMillis();
                currentTaskIndex++;
                takeNext = false;
            }
            return checkedAnswer;
        } else {
            throw new InvalidAnswer();
        }
    }

    @Override
    public boolean next() {
        if (examTasks.size() > currentTaskIndex) {
            takeNext = true;
            startTime = System.currentTimeMillis() + 3000;
            endTime = startTime + currentTask().getTime() * 60 * 1000 + 3000;
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Task currentTask() {
        return examTasks.get(currentTaskIndex);
    }

    @Override
    public long laftTime() {
        return endTime - System.currentTimeMillis();
    }

    @Override
    public long spentTime() {
        return System.currentTimeMillis() - startTime;
    }

    @Override
    public long totalTime() {
        return timeOfPass - startTime;
    }

    private void saveResult(CheckedAnswer checkedAnswer) throws Exception {
        if (this.SAVE_ATTEMPT) {
                Attempt attempt = checkedAnswer.getAttempt();
                attempt.setWorkId(work.getId());
                attempt.save();
            }
            Result result = checkedAnswer.getResult();
            result.setWorkId(work.getId());
            result.save();
    }

}
