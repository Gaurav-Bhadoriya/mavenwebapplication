<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
    <h2>Error</h2>
    <p>Please check your age and Date of Birth the age should between 18 to 65 or you have provided the future Date</p>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to Employee List</a>
</body>
</html>
