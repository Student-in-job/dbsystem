<%-- 
    Document   : bar
    Created on : 24.10.2017, 9:12:50
    Author     : ksinn
    Блок страницы с меню.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="message" class="message">
    ${message}
</div>
<div class="row around">
    <div class="col col-3 space-top">
        <div id="sidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <div class="row centered">
                <img class="logo-round" src="${pageContext.request.contextPath}/resourse/img/logo-round.png">
            </div>

            <div class="row centered search-box">
                <form method="get" action="${pageContext.request.contextPath}/Courses.jsp" class="form">
                    <div class="form-item">
                        <div class="controls">
                            <input type="text" name="find" placeholder="Search">
                            <button class="button inverted">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="valign-sidenav">
                <div class="row centered">
                    <a href="${pageContext.request.contextPath}/about_as.jsp"><b>ABOUT US</b></a>
                    <a href="${pageContext.request.contextPath}/manual.pdf"><b>MANUAL</b></a>
                    <a href="${pageContext.request.contextPath}/program/Courses"><b>COURSES</b></a>
                </div>
                <div class="row centered">
                    <a href="${pageContext.request.contextPath}/user/Peoples"><b>PEOPLE</b></a>
                </div>
            </div>
        </div>
        <!--<a class="h3" style="cursor: pointer;" onclick="openNav()"><i class="fa fa-bars"></i> <b>MENU</b></a>-->
    </div>
    <div class="col col-3 text-center">
        <a href="${pageContext.request.contextPath}"><div class="item centered logo"></div></a>
        <h5 class="upper primary"><img width="150" src="${pageContext.request.contextPath}/resourse/img/name.png"><%--=request.getServletContext().getInitParameter("SiteName")--%></h5>
    </div>
    <c:choose>
        <c:when test="${user != null}">
            <div class="col col-3">
                <div class="col col-8 offset-5 space-top"> 
                    <div class="${main}user_board">

                        <img src="${pageContext.request.contextPath}/file/user/ico/${user.id}.png" onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/cat_${user.id%8+1}.png';" class="usr-img float-left">

                        <a href="${pageContext.request.contextPath}/user/cabinet" class="button small round outline" style="text-decoration: none;">${user.name} &rarr;</a>
                        <br>
                        <a href="${pageContext.request.contextPath}/user/logOut" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;Log out <i class="fa fa-sign-out"></i></a>
                    </div>
                </div>
            </div>        
        </c:when>
        <c:otherwise>
            <div class="col col-3 space-top text-right">
                <img src="${pageContext.request.contextPath}/resourse/img/${main}login-ico.png"> 
                <a class="${main}login h4" data-width="450px" data-component="modal" data-target="#login-modal">Log in</a>
            </div>
        </c:otherwise>
    </c:choose>
    <div id="login-modal" class="modal-box hide">
        <div class="modal">
            <span class="close"></span>
            <div class="modal-header">Sign in</div>
            <div class="modal-body text-center">
                <c:choose>
                    <c:when test="${Boolean.parseBoolean(initParam.oAuth)}">
                        <a href="${auth_url}"><img class="login-favicons" src="${pageContext.request.contextPath}/resourse/img/google-favicon.svg"></a>
                            <%--<a href="${pageContext.request.contextPath}/user/auth1"><img class="login-favicons" src="${pageContext.request.contextPath}/img/google-favicon.svg"></a>
                            <a href="${pageContext.request.contextPath}/user/SignUp"><img class="login-favicons" src="${pageContext.request.contextPath}/img/google-favicon.svg"> SignUp</a>--%>
                        </c:when>
                        <c:otherwise>
                        <form class="form" method="get" action="${pageContext.request.contextPath}/user/signIn">
                            <div class="form-item">
                                <label>Google mail</label>
                                <input type="email" name="mail" required >
                            </div>

                            <div class="form-item">
                                <button class="button primary width-100 big">Sign In</button>
                            </div>
                        </form>
                    </c:otherwise> 
                </c:choose>
            </div> 
        </div>
    </div>
</div>
<!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
<script src="${pageContext.request.contextPath}/resourse/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resourse/js/kube.min.js"></script>
<script>
            function openNav() {
                document.getElementById("sidenav").style.width = "100%";
            }

            function closeNav() {
                document.getElementById("sidenav").style.width = "0";
            }
</script> 
