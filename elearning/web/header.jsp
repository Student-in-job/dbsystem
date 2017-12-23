<%-- 
    Document   : header
    Created on : 20.08.2016, 14:44:22
    Author     : ksinn
    Заголовок страниц. 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String main = (request.getServletContext().getContextPath() + "/").equals(request.getRequestURI()) ? "main-" : "";

    String client_id = "1006393654499-p8mr2fj0fkg43ifvl68eo2k18o6u2qgm.apps.googleusercontent.com";
    String client_secret = "lU9JFY65Oy7Oas33THOn_CUN";
    String redirect_uri = "/user/signIn";
    String response_type = "code";
    String scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";

    String auth_url = "https://accounts.google.com/o/oauth2/auth?"
            + "client_id=" + client_id
            + "&redirect_uri=" + redirect_uri
            + "&response_type=" + response_type
            + "&scope=" + scope;

    pageContext.setAttribute("auth_url", auth_url);
    pageContext.setAttribute("main", main);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${pageTitle} :: ${initParam.SiteName} &mdash; 2016 </title>
        <meta charset="utf-8">
        <link href="${pageContext.request.contextPath}/resourse/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resourse/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resourse/css/font-awesome.min.css">
        <!-- Kube CSS -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resourse/css/kube_new.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resourse/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resourse/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resourse/css/master.css">
        <script src="${pageContext.request.contextPath}/resourse/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resourse/js/kube.min.js"></script>
    </head>
    <body>

