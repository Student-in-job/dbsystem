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
        String birthday = request.getParameter("birthday");
        int cert = Integer.parseInt(request.getParameter("certif"));
        int dep = Integer.parseInt(request.getParameter("dep_count"));

        
        Random ran = new Random();
        String[] arr_names = names.split("\n");
        String[] arr_birthday = birthday.split("\n");

        for(int i=0; i<arr_names.length; i++){
            String[] split_name = arr_names[i].split(" ");
            String query = "insert into doctor(department, name, surname, patronymic, birthday, institution) value ("
                    + String.valueOf(ran.nextInt(dep)+1)+", "
                    +"'"+split_name[1]+"', "
                    + "'"+split_name[0]+"', "
                    + "'"+split_name[2]+"', "
                    + "'"+arr_birthday[i]+"', "
                    + String.valueOf(ran.nextInt(cert)+1)+" "
                    + ");<br>";
            out.print(query);

        }
    
} else {%>
<form method = "post" action ="">
    name <textarea name="name"></textarea><br>
    birthday <textarea name="birthday"></textarea><br>
    dep_count <input name="dep_count"><br>
    certif <input name="certif"><br>
    <input type="submit"><br>
</form>
<%}%>
