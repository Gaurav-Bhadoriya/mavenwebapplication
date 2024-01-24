<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
</head>
<body>
    <h2>Update Employee</h2>
    
    <form action="<%= request.getContextPath() %>/employee?action=update" method="Post" onsubmit="return validateForm()">
        <input type="hidden" name="employeeId" value="${employee.employeeId}">
        <label for="name">Name:</label>
        <input type="text" id="name" name="employeeName" value="${employee.employeeName}" required>
        <br>
        <label for="skills">Skills:</label>
        <label for="skills">Skills:</label>
		<input type="checkbox" name="employeeSkills" value="Java" ${employee.employeeSkills.contains("Java") ? 'checked' : ''}> Java
		<input type="checkbox" name="employeeSkills" value="Python" ${employee.employeeSkills.contains("Python") ? 'checked' : ''}> Python
		<input type="checkbox" name="employeeSkills" value="C#" ${employee.employeeSkills.contains("C#") ? 'checked' : ''}> C#
		<input type="checkbox" name="employeeSkills" value="Node" ${employee.employeeSkills.contains("Node") ? 'checked' : ''}> Node
        
        <br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="employeeAge" value="${employee.employeeAge}" required>
        <br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="employeeSalary" value="${employee.employeeSalary}" required>
        <br>
        <label for="birthDate">Birth Date:</label>
        <input type="date" name="employeeBirthDate" id="birthDate" value="${employee.employeeBirthDate}" onchange="ageCalculation()"> 
       <!--  <script>
            function validateForm() {
                var currentDate = new Date();
                var val = document.getElementById("birthDate").value;
                var birthDate = new Date(val);
                var age = currentDate.getFullYear() - birthDate.getFullYear();

                if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
                    age--;
                }

                if (age < 0 || age < 8 || age > 65) {
                    window.alert("Age should be in between 8 to 65.");
                    return false;
                }
                return true;
            }
        </script> -->
        <br>
        <input type="submit" value="Update">
    </form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html>



