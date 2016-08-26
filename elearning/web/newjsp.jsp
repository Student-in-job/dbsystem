<%-- 
    Document   : newjsp
    Created on : 23.08.2016, 16:07:36
    Author     : ksinn
--%>

<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
User user = new User(1);
user.SendPassword();
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery Validation plugin: integration with TinyMCE</title>
<script src="../../lib/jquery.js"></script>
<script src="../../dist/jquery.validate.js"></script>
<script src="tiny_mce.js"></script>
<script>

    
    tinyMCE.init({
		mode: "textareas",
		theme: "simple",
		// update validation status on change
		onchange_callback: function(editor) {
			tinyMCE.triggerSave();
			$("#" + editor.id).valid();
		}
	});
	$(function() {
		var validator = $("#myform").submit(function() {
			// update underlying textarea before submit validation
			tinyMCE.triggerSave();
		}).validate({
			ignore: "",
			rules: {
				title: "required",
				content: "required"
			},
			errorPlacement: function(label, element) {
				// position error label after generated textarea
				if (element.is("textarea")) {
					label.insertAfter(element.next());
				} else {
					label.insertAfter(element)
				}
			}
		});
		validator.focusInvalid = function() {
			// put focus on tinymce on submit validation
			if (this.settings.focusInvalid) {
				try {
					var toFocus = $(this.findLastActive() || this.errorList.length && this.errorList[0].element || []);
					if (toFocus.is("textarea")) {
						tinyMCE.get(toFocus.attr("id")).focus();
					} else {
						toFocus.filter(":visible").focus();
					}
				} catch (e) {
					// ignore IE throwing errors when focusing hidden elements
				}
			}
		}
	})
	</script>
 
</head>
<body>
<form id="myform" action="">
<h3>TinyMCE and Validation Plugin integration example</h3>
<label>Some other field</label>
<input name="title">
<br>
<label>Some richt text</label>
<textarea id="content" name="content" rows="15" cols="80" style="width: 80%"></textarea>
<br>
<input type="submit" name="save" value="Submit">
</form>
</body>
</html>
