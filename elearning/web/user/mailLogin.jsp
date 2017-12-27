<%-- 
    Document   : Error
    Created on : 24.07.2016, 11:37:12
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String pageTitle = "Sign In";%>
<%@include file="/header.jsp" %>
<%@include file="/bar.jsp" %>
<div class="row centered bg-blue">
    <div class="col col-3 push-middle">
        <form class="form" action="signIn" method="get">
                <div class="form-item">
                    <label>Google mail</label>
                    <input type="email" name="mail" required >
                </div>

                <div class="form-item text-center">
                    <button class="button primary width-100 big">Sign In</button>
                </div>
            </form>
        </div>
    </div>
<%@include file="/footer.jsp" %>

<script>

    function show()
    {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/SendSMS",
            cache: false,
            error: function () {
                $("#sms-message").html("error");
            },
            success: function (data) {
                $("#sms-message").html(data);

            }
        });
    }

</script> 
</body>
</html>
