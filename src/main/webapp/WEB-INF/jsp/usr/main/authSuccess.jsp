<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>본인인증 완료</title>
</head>
<body>
<script>
var redirectUrl = "${redirectUrl}";
if (window.opener) {
    window.opener.location.href = redirectUrl;
    window.close();
} else {
    window.location.href = redirectUrl;
}
</script>
<p><c:out value="${message}"/></p>
</body>
</html>
