<%-- 
    Document   : patients
    Created on : 08.12.2016, 17:23:40
    Author     : ksinn
--%>

<%@page import="java.util.Calendar"%>
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
        String doctors = request.getParameter("doctor");
        int patient = Integer.parseInt(request.getParameter("patient"));
        
        DateFormat form = new SimpleDateFormat("yyyy-MM-dd");
        Random ran = new Random();
        Calendar time = Calendar.getInstance();
        
        
        String[] arr_names = names.split("\n");
        String[] arr_doctors = doctors.split("\n");

        for(int i=ran.nextInt(15); i<patient; i+=ran.nextInt(15)){
            time.set(Calendar.YEAR, 2015+ran.nextInt(2));
            time.set(Calendar.MONTH, ran.nextInt(12)+1);
            time.set(Calendar.DAY_OF_MONTH, ran.nextInt(30)+1);
            String query = "insert into diagnosis(doctor, patient, name, date) value ("
                    +String.valueOf(arr_doctors[ran.nextInt(arr_doctors.length)])+", "
                    +String.valueOf(i)+", "
                    +"'"+arr_names[ran.nextInt(arr_names.length)]+"', "
                    + "'"+form.format(time.getTime())+"' "
                    + ");<br>";
            out.print(query);

        }
    
} else {%>
<form method = "post" action ="">
    name <textarea name="name"></textarea>
    doctor <textarea name="doctor"></textarea>
    patient <input name="patient"></form>
    <input type="submit">
</form>
<%}%>
