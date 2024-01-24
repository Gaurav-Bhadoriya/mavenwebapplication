<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <c:if test="${empty employee.employeeId}">Add</c:if>
        <c:if test="${not empty employee.employeeId}">Update</c:if>
    </title>
    <script>
        function validateForm() {
            var age = document.getElementById("age").value;
            var birthDate = document.getElementById("birthDate").value;
            var currentDate = new Date().toISOString().split('T')[0];
            if (age < 18 || age > 65) {
                alert("Age must be between 18 and 65 years.");
                return false;
            }
            if (birthDate > currentDate) {
                alert("Birth Date cannot be a future date.");
                return false;
            }
            return true;
        }
	        function setMaxDate() {
	            var currentDate = new Date().toISOString().split('T')[0];
	            document.getElementById("birthDate").max = currentDate;
	        }
    </script>
</head>
<body onload="setMaxDate()">
    <h2>
        <c:if test="${empty employee.employeeId}">Add Employee</c:if>
        <c:if test="${not empty employee.employeeId}">Update Employee</c:if>
    </h2>
    <form action="<%= request.getContextPath() %>/employee?action=${empty employee.employeeId ? 'add' : 'update'}" method="Post" onsubmit="return validateForm()">
    <c:if test="${not empty employee.employeeId}">
        <input type="hidden" name="employeeId" value="${employee.employeeId}">
    </c:if>
    <label for="name">Name:</label>
    <input type="text" id="name" name="employeeName" value="${employee.employeeName}" required>
    <br>
    <label for="skills">Skills:</label>
    <input type="checkbox" name="employeeSkills" value="Java" ${fn:contains(employee.employeeSkills, 'Java') ? 'checked' : ''}> Java
    <input type="checkbox" name="employeeSkills" value="Python" ${fn:contains(employee.employeeSkills, 'Python') ? 'checked' : ''}> Python
    <input type="checkbox" name="employeeSkills" value="C#" ${fn:contains(employee.employeeSkills, 'C#') ? 'checked' : ''}> C#
    <input type="checkbox" name="employeeSkills" value="Node" ${fn:contains(employee.employeeSkills, 'Node') ? 'checked' : ''}> Node
    <br>
    <label for="age">Age:</label>
    <input type="number" id="age" name="employeeAge" value="${employee.employeeAge}" required>
    <br>
    <label for="salary">Salary:</label>
    <input type="number" id="salary" name="employeeSalary" value="${employee.employeeSalary}" required>
    <br>
    <label for="birthDate">Birth Date:</label>
    <input type="date" name="employeeBirthDate" id="birthDate" value="${employee.employeeBirthDate}" onchange="checkDate()" required>
    <br>
    <input type="hidden" id="selectedSkills" name="selectedSkills" required>
    <br>
    <input type="submit" value="${empty employee.employeeId ? 'Add' : 'Update'}">
</form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html>