<%-- 
    Document   : CreateMaterialSchedule
    Created on : 06.08.2016, 11:47:59
    Author     : ksinn
--%>

<%@page import="java.sql.Array"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null){
        response.sendRedirect("../login.jsp"); return;}
    
    int program = Integer.parseInt(request.getParameter("program")); 
    Course course = (Course) session.getAttribute("course");
    if(course==null) {response.sendRedirect("CreateCourse.jsp?program="+String.valueOf(program)); return;}
    ArrayList<Material> material = (ArrayList<Material>) session.getAttribute("material");
    ArrayList<Test> test = (ArrayList<Test>) session.getAttribute("test");
    
    SimpleDateFormat form = new SimpleDateFormat();
    form.applyPattern("yyyy-MM-dd");    
    
    material = course.getProgram().getMaterials();
    test = course.getProgram().getTests();
        
        if(request.getMethod().equals("GET")){
            
        HashMap<Integer, Day> days = new HashMap<Integer, Day>();
        Day d;
        for(int i=0;i<material.size(); i++){
            d = days.get(material.get(i).getDay());
            if(d==null)
                d = new Day(new Date(course.getDate().getTime()+3600*24*1000*material.get(i).getDay()));
            d.put(material.get(i));
            days.put(material.get(i).getDay(), d);
        }
        
        for(int i=0;i<test.size(); i++){
            d = days.get(test.get(i).getDay());
            if(d==null)
                d = new Day(new Date(course.getDate().getTime()+3600*24*1000*test.get(i).getDay()));
            d.put(test.get(i));
            days.put(test.get(i).getDay(), d);
        }

            
            
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CreateCourse:1</h1>
        <form method="POST" action="CreateMaterialSchedule.jsp">
            <input type="hidden" name="program" value="<%=program%>">
<%for(Entry entry : days.entrySet()){ %>            
            <div>
                <p>Day <%=entry.getKey()%>:</p>
                <input requered type="date" name="<%=entry.getKey()%>" value="<%=form2.format(((Day)entry.getValue()).getDate())%>">
                <div>
                    <%for(int i=0; i<((Day)entry.getValue()).Size(); i++){%>
                    <p><%=((Day)entry.getValue()).get(i).getName()%></p>
                    <%}%>
                </div>
            </div>
<%}%>
            <input type="submit">
        </form>
    </body>
</html>
<%}
        if(request.getMethod().equals("POST")){
            HashMap<Integer, Date> days = new HashMap<Integer, Date>();
            Enumeration<String> name = request.getParameterNames();
            name.nextElement();//первый параметор это id программы
            while(name.hasMoreElements()){
                String key = name.nextElement();
                String value = request.getParameter(key);
                days.put(Integer.parseInt(key), form.parse(value));
            }
            
            Integer []k = days.keySet().toArray(new Integer[1]);//сортировка, что бы дни были по порядку
            for(int i=0; i<k.length-1; i++)
                for(int j=i+1; j<k.length; j++){
                    if(k[i]>k[j]){
                        int buf = k[j];
                        k[j] = k[i];
                        k[i] = buf;
                    }
                }
            boolean err=false;
            for(int i=1; i<k.length-1; i++){ //проверка что бы даты дней были по порядку
                Date d = days.get(k[i]);
                Date d1 = days.get(k[i-1]);
                Date d2 = days.get(k[i+1]);
                if(!(d.after(d1)&&d.before(d2)))
                    {err=true; break;}
            }

            long a = course.getProgram().getDuration()+(course.getProgram().getDuration()*2)/7+3;
            Date dl = new Date(course.getDate().getTime() + 3600*1000*24*a);
            Date d2 = days.get(k[k.length-1]);
            if(d2.after(dl)) err=true;
            
            if(err){
            %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Неправельно указонн даты</h1>
    </body>
</html>
<%
            }
            else{
                for(int i=0; i<material.size(); i++){
                    material.get(i).setDate(days.get(material.get(i).getDay()));
                }
                for(int i=0; i<test.size(); i++){
                    test.get(i).setDate(days.get(test.get(i).getDay()));
                }

                session.setAttribute("material", material);
                session.setAttribute("test", test);
                response.sendRedirect("CreateCourse.jsp?create=ok");
            
            }
        }
%>