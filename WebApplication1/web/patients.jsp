<%-- 
    Document   : patients
    Created on : 08.12.2016, 17:23:40
    Author     : ksinn
--%>

<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getMethod().equals("POST")){
        request.setCharacterEncoding("UTF-8");
        String names = request.getParameter("name");
        String dates = request.getParameter("date");
        String sex = request.getParameter("sex");

        

        String[] arr_names = names.split("\n");
        String[] arr_dates = dates.split("\n");

        for(int i=0; i<arr_names.length; i++){
            String[] split_name = arr_names[i].split(" ");
            String query = "insert into patient(name, surname, patronymic, birthday, sex) value ("
                    + "'"+split_name[1]+"', "
                    + "'"+split_name[0]+"', "
                    + "'"+split_name[2]+"', "
                    + "'"+arr_dates[i]+"', "
                    + "'"+sex+"'"
                    + ");<br>";
            out.print(query);

        }
    
} else {%>
<form method = "post" action ="">
    <textarea name="name"></textarea>
    <textarea name="date"></textarea>
    <input name="sex">
    <input type="submit">
</form>
<%}%>
