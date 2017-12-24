/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entety;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author ksinn
 */
public class Course extends Parent {

    //дата начала курса
    private Date StartDate;
    private String Name;
    private String Decsription;
    private int Duration;
    private User User;
    private int UserId;
    //флаг открытого курса, если истина, то на курс студенты могут записываться самостоятельно
    private boolean open;
    //флаг оконченности курса, если истина, то курс не ведеться
    private int status;

    @Override
    public String _getType() {
        return "course";
    }

    public Course() {
        this.User = new User();
    }

    public void getById(int id) throws Exception {
        if (id > 0) {
            this.ID = id;
            this._select();
        } else {
            throw new Exception("Invalid input data for course whith id=" + id);
        }
    }

    public User getUser() {
        return this.User;
    }

    public int getDuration() {
        return this.Duration;
    }

    public String getName() {
        return this.Name;
    }

    public String getDescription() {
        return this.Decsription;
    }

    public String getShortDescription() {
        if (this.Decsription.length() < 50) {
            return this.Decsription;
        } else {
            return this.Decsription.substring(0, 50);
        }
    }

    @Override
    protected boolean _isCorrect() {
        return true;
    }

    public void ReadUserFromDB() throws Exception {
        this.User.getById(this.UserId);
    }

    public void setName(String name) {
        this._from_db = false;
        this.Name = name;
    }

    public void setDiscription(String description) {
        this._from_db = false;
        this.Decsription = description;
    }

    public void setDuration(int duration) {
        this._from_db = false;
        this.Duration = duration;
    }

    public boolean Write() throws Exception {
        return this._insert();
    }

    public boolean Update() throws Exception {
        return this._update();
    }

    public Date getStartDate() {
        return StartDate;
    }

    public boolean isClosed() {
        return status == 0;
    }

    public boolean isOpened() {
        return this.open;
    }

    public void setOpen(boolean data) {
        this._from_db = false;
        this.open = data;
    }

    public void setStatus(int data) {
        this.status = data;
    }

    public void setStartDate(Date data) {
        this._from_db = false;
        this.StartDate = data;
    }

    @Override
    public boolean MayChange() {
        return true;
    }

    @Override
    protected HashMap<String, Object> _getParams() {
        HashMap<String, Object> list = new HashMap<String, Object>();
        list.put("start_date", this.StartDate);
        list.put("status", this.status);
        list.put("open", this.open ? 1 : 0);
        list.put("name", this.Name);
        list.put("description", this.Decsription);
        list.put("duration", this.Duration);
        list.put("users", this.UserId);
        return list;
    }

    @Override
    protected void _setParams(HashMap<String, Object> Params) throws Exception {
        this.StartDate = (Date) Params.get("start_date");
        this.status = (int) Params.get("status");
        this.open = (int) Params.get("open") == 1;
        this.Name = (String) Params.get("name");
        this.Decsription = (String) Params.get("description");
        this.Duration = (int) Params.get("duration");
        this.UserId = (int) Params.get("users");
        ReadUserFromDB();

    }

    public boolean Create() throws NamingException, SQLException {
        return this._insert();
    }

    public boolean canStart(User user) throws Exception {
        return this.open
                && this.status == 1
                && this.getUser().getId() != user.getId() //&&!user.haveCourse(this)
                ;
    }

    public boolean canAddToCourse(User tuter, User stud) throws Exception {
        return this.status == 1
                && this.getUser().getId() == tuter.getId()
                && stud.getId() != tuter.getId();
    }

    public void setUser(User user) {
        User = user;
        UserId = user.ID;
    }
}
