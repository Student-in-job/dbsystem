/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TasKer.Exam.Impl;

import static TasKer.Core.TasKer.getChecker;
import static TasKer.Core.TasKer.getExamTasksGenerator;
import TasKer.Tasks.Task;
import TasKer.Work.Work;
import TasKer.Core.InvalidAnswer;
import TasKer.Exam.Answer;
import TasKer.Exam.Attempt;
import TasKer.Exam.CheckedAnswer;
import TasKer.Exam.Examinator;
import TasKer.Exam.Result;
import java.util.ArrayList;
import java.util.Iterator;

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

    private String message;

    private boolean takeNext;

    private void start() throws Exception {
        currentTaskIndex = -1;
        next();
        message = "Exam has been started";
    }

    @Override
    public void prepareExam(Work work) throws Exception {
        this.work = work;
        examTasks = getExamTasksGenerator().generate(work, work.getList(), work.getCount());
        start();
    }

    @Override
    public void continueExam(Work work) throws Exception {
        this.work = work;
        Result result = new ResultEntety();
        ArrayList<Result> results = result.getResultsByWork(work.getId());
        examTasks = getExamTasksGenerator().regenerate(work, work.getList(), work.getCount(), results);
        start();
    }

    @Override
    public Work finishExam() throws Exception {
        work.setMark(calculateMatk());
        return work;
    }

    private int calculateMatk() throws Exception {
        int mark = 0;
        Result result = new ResultEntety();
        Iterator<Result> results = result.getResultsByWork(work.getId()).iterator();
        while (results.hasNext()) {
            int m = results.next().getMark();
            if(m>0)
            mark += m;
        }
        return mark;
    }

    @Override
    public CheckedAnswer check(Answer answer) throws Exception {
        long time = System.currentTimeMillis();
        if (time - 3000 > endTime) {
            message = "Time expired";
            return new SimpleCheckedAnswer(true, answer) {
            };
        }
        if (getChecker().valid(answer)) {
            CheckedAnswer checkedAnswer = getChecker().check(answer);
            saveResult(checkedAnswer);
            if (checkedAnswer.isAccept()) {
                message = "Answer has been accepted";
                timeOfPass = System.currentTimeMillis();
                takeNext = false;
            } else {
                message = "Wrong answer";
            }
            return checkedAnswer;
        } else {
            throw new InvalidAnswer();
        }
    }

    @Override
    public boolean next() throws Exception{
        message = "Next task";
        currentTaskIndex++;
        if (examTasks.size() > currentTaskIndex) {
            takeNext = true;
            startTime = System.currentTimeMillis() + 3000;
            endTime = startTime + currentTask().getTime() * 60 * 1000 + 3000;
            saveNullResult();
            return true;
        } else {
            message = "Thet was last task";
            return false;
        }
    }

    private void saveNullResult() throws Exception {
        Result result = new ResultEntety();
        result.setTaskId(currentTask().getId());
        result.setMark(-1);
        result.setWorkId(work.getId());
        result.save();
        
    }

    @Override
    public Task currentTask() {
        return examTasks.get(currentTaskIndex);
    }

    @Override
    public long leftTime() {
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

    @Override
    public String popMessage() {
        String mes = this.message;
        message = null;
        return mes;
    }

}
