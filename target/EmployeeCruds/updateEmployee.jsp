<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date, java.util.Arrays" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
</head>
<body>
    <h2>Update Employee</h2>
    
    <form id="employeeForm" action="<%= request.getContextPath() %>/employee?action=update" method="Post">
        <input type="hidden" name="employeeId" value="<%= request.getParameter("employeeId") %>">
        <!-- Include the employeeId as a hidden field to identify the employee being updated -->

        <label for="name">Name:</label>
        <input type="text" id="name" name="employeeName" value="<%= request.getParameter("employeeName") %>" required>
        <br>
        <label for="skills">Skills:</label>
        <input type="checkbox" name="employeeSkills" value="Java" <% if(request.getParameterValues("employeeSkills") != null && Arrays.asList(request.getParameterValues("employeeSkills")).contains("Java")) { %>checked<% } %>> Java
        <input type="checkbox" name="employeeSkills" value="Python" <% if(request.getParameterValues("employeeSkills") != null && Arrays.asList(request.getParameterValues("employeeSkills")).contains("Python")) { %>checked<% } %>> Python
        <input type="checkbox" name="employeeSkills" value="C#" <% if(request.getParameterValues("employeeSkills") != null && Arrays.asList(request.getParameterValues("employeeSkills")).contains("C#")) { %>checked<% } %>> C#
        <input type="checkbox" name="employeeSkills" value="Node" <% if(request.getParameterValues("employeeSkills") != null && Arrays.asList(request.getParameterValues("employeeSkills")).contains("Node")) { %>checked<% } %>> Node
        <br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="employeeAge" value="<%= request.getParameter("employeeAge") %>" required>
        <br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="employeeSalary" value="<%= request.getParameter("employeeSalary") %>" required>
        <br>
        <label for="birthDate">Birth Date:</label>
        <input type="date" name="employeeBirthDate" id="birthDate" value="<%= request.getParameter("employeeBirthDate") %>" onchange="ageCalculation()" required> 
        <!-- Include the value attribute to pre-fill the birth date field -->

        <!-- Include the age calculation script as you did in the "Add Employee" page -->
        <br>
     
        <input type="hidden" id="selectedSkills" name="selectedSkills" required>
        <input type="submit" value="Update">
    </form>
    <br>
    <a href="<%= request.getContextPath() %>/employee?action=list">Back to List</a>
</body>
</html>
 --%>