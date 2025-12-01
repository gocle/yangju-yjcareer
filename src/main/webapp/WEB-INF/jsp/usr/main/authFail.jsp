<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
 <title>본인인증 실패</title>
<script type="text/javascript">
  window.onload = function() {
      var redirectUrl = "${contextRoot}/${redirectUrl}";
      
      var msg = "<c:out value='${message}'/>";
      if(msg) alert(msg);
      
      if(redirectUrl && redirectUrl !== "") {
          if(window.opener) {
              window.opener.location.href = redirectUrl;
          } else {
              window.location.href = redirectUrl;
          }
      }
      window.close();
  };
</script>
</head>
<body>
    <p>본인인증에 실패했습니다. 창이 자동으로 닫히지 않으면 이 창을 닫아주세요.</p>
</body>
</html>