<%-- 
    Document   : footer
    Created on : 20.08.2016, 14:54:04
    Author     : ksinn
--%>

<div class="footer">
	<div class="row">
		<div class="col text-center"><h6><%=request.getServletContext().getInitParameter("SiteName")%> &copy; 2016, All right reserved.</h6></div>
	</div>	
	<div class="row">
		<div class="col text-center small"><b>Made with <i class="fa fa-heart error"></i> in <a href="http://www.tuit.uz/">TUIT</b></a></div>
	</div>
	<div class="row">
            <div class="col text-center"><p><img src="${pageContext.request.contextPath}/img/we_love_to_code.png" width="200px" height="31px"></p></div>
	</div>
</div>
