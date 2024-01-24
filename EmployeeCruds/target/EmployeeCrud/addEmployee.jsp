<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    
        <form action="<%= request.getContextPath() %>/employee?action=add" method="Post">
	    <label for="name">Name:</label>
	    <input type="text" id="name" name="employeeName" required>
	    <br>
        <label for="skills">Skills:</label>
        <input type="text" id="skills" name="employeeSkills" required>
        <br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="employeeAge" required>
        <br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="employeeSalary" required>
        <br>
        <label for="birthDate">Birth Date:</label>
        <input type="text" id="birthDate" name="employeeBirthDate" placeholder="YYYY-MM-DD" required>
        <br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html>  --%>
<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date"%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    
    <form action="<%= request.getContextPath() %>/employee?action=add" method="Post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="employeeName" required>
        <br>
        <label for="skills">Skills:</label>
        <input type="checkbox" name="java" value="Java"> Java
        <input type="checkbox" name="python" value="Python"> Python
        <input type="checkbox" name="csharp" value="C#"> C#
        <input type="checkbox" name="node" value="Node"> Node
        <br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="employeeAge" required>
        <br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="employeeSalary" required>
        <br>
        <label for="birthDate">Birth Date:</label>
        <input type="date" name="employeeBirthDate" id="birthDate" onchange="ageCalculation()"> 
        <!-- <input type="text" id="birthDate" name="employeeBirthDate" placeholder="YYYY-MM-DD" required> -->
		<script>
		function ageCalculation(){

			  var currentDate = new Date();
			  var val = document.getElementById("birthDate").value;
			  var birthDate = new Date(val);
			  var difference = currentDate - birthDate;
			  
			  var differenceInYears = Math.floor(difference / (1000 * 60 * 60 * 24 * 365.25));
			  if(birthDate > currentDate) {
			    window.alert("You cannot be born in the future");
			  } else if( differenceInYears>8) {
			    window.alert("Age should be less than 8 years");
			  } else {
			    document.getElementById("age").value = differenceInYears ;
			  }
			}
		</script>
        <br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    
    <form action="<%= request.getContextPath() %>/employee?action=add" method="Post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="employeeName" required>
        <br>
        <label for="skills">Skills:</label>
        <input type="checkbox" name="java" value="Java"> Java
        <input type="checkbox" name="python" value="Python"> Python
        <input type="checkbox" name="csharp" value="C#"> C#
        <input type="checkbox" name="node" value="Node"> Node
        <br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="employeeAge" required readonly>
        <br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="employeeSalary" required>
        <br>
        <label for="birthDate">Birth Date:</label>
        <input type="date" name="employeeBirthDate" id="birthDate" onchange="ageCalculation()"> 
		<script>
		function ageCalculation(){
			var currentDate = new Date();
			var val = document.getElementById("birthDate").value;
			var birthDate = new Date(val);
			
			var age = currentDate.getFullYear() - birthDate.getFullYear();
			
			if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
				age--;
			}
			if (age < 0) {
				window.alert("Age should be in between 8 to 65.");
			} else {
				document.getElementById("age").value = age;
			}
		}
		</script>
        <br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    <a href="<%= request.getContextPath() %>/employee?action=list">Employee List</a>
    
    <form id="employeeForm" action="<%= request.getContextPath() %>/employee?action=add" method="Post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="employeeName" required>
        <br>
        <label for="skills">Skills:</label>
        <input type="checkbox" name="employeeSkills" value="Java"> Java
        <input type="checkbox" name="employeeSkills" value="Python"> Python
        <input type="checkbox" name="employeeSkills" value="C#"> C#
        <input type="checkbox" name="employeeSkills" value="Node"> Node
        <br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="employeeAge" required>
        <br>
        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="employeeSalary" required>
        <br>
        <label for="birthDate">Birth Date:</label>
        <input type="date" name="employeeBirthDate" id="birthDate" onchange="ageCalculation()" required> 
		<!-- <script>
		function ageCalculation(){
			var currentDate = new Date();
			var val = document.getElementById("birthDate").value;
			var birthDate = new Date(val);
			
			var age = currentDate.getFullYear() - birthDate.getFullYear();
			
			if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
				age--;
			}
			if (age < 0) {
				window.alert("Age should be in between 8 to 65.");
			} else {
				document.getElementById("age").value = age;
			}
		}
		</script> -->
        <br>
     
        <input type="hidden" id="selectedSkills" name="selectedSkills" required>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html>
