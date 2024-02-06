<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</html> --%>



<%-- 
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
</html> --%>



<%-- 
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

       /*  function updateSelectedSkills() {
            var selectedSkills = [];
            var checkboxes = document.getElementsByName("employeeSkills");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedSkills.push(checkboxes[i].value);
                }
            }
            document.getElementById("selectedSkills").value = selectedSkills.join(",");
        } */
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
        <input type="checkbox" name="employeeSkills" value="Java" ${fn:contains(employee.employeeSkills, 'Java') ? 'checked' : ''} onclick="updateSelectedSkills()"> Java
        <input type="checkbox" name="employeeSkills" value="Python" ${fn:contains(employee.employeeSkills, 'Python') ? 'checked' : ''} onclick="updateSelectedSkills()"> Python
        <input type="checkbox" name="employeeSkills" value="C#" ${fn:contains(employee.employeeSkills, 'C#') ? 'checked' : ''} onclick="updateSelectedSkills()"> C#
        <input type="checkbox" name="employeeSkills" value="Node" ${fn:contains(employee.employeeSkills, 'Node') ? 'checked' : ''} onclick="updateSelectedSkills()"> Node
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





 --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    
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
        <input type="text" id="salary" name="employeeSalary" required>
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
</html> --%>



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

        function updateSelectedSkills() {
            var selectedSkills = [];
            var checkboxes = document.getElementsByName("employeeSkills");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedSkills.push(checkboxes[i].value);
                }
            }
            document.getElementById("selectedSkills").value = selectedSkills.join(",");
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
        <input type="checkbox" name="employeeSkills" value="Java" ${fn:contains(employee.employeeSkills, 'Java') ? 'checked' : ''} onclick="updateSelectedSkills()"> Java
        <input type="checkbox" name="employeeSkills" value="Python" ${fn:contains(employee.employeeSkills, 'Python') ? 'checked' : ''} onclick="updateSelectedSkills()"> Python
        <input type="checkbox" name="employeeSkills" value="C#" ${fn:contains(employee.employeeSkills, 'C#') ? 'checked' : ''} onclick="updateSelectedSkills()"> C#
        <input type="checkbox" name="employeeSkills" value="Node" ${fn:contains(employee.employeeSkills, 'Node') ? 'checked' : ''} onclick="updateSelectedSkills()"> Node
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
