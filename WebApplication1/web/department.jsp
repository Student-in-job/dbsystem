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

        for(int i=0; i<arr_names.length; i++){
            String query = "insert into department(name) value ("
                    + "'"+arr_names[i]+"');<br>";
            out.print(query);

        }
    
} else {%>
<form method = "post" action ="">
    <textarea name="name"></textarea>
    <input type="submit">
</form>
<%}%>
