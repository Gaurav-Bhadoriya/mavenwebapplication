<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
</head>
<body>
    <h2>Employee List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Skills</th>
                <th>Age</th>
                <th>Salary</th>
                <th>Birth Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="counter" value="0"/>
            <c:forEach var="employee" items="${employees}">
                <c:set var="counter" value="${counter + 1}" />
                <tr>
                    <td>${counter}</td>
                    <td>${employee.employeeId}</td>
                    <td>${employee.employeeName}</td>
                    <td>
                        <c:forEach var="skill" items="${employee.employeeSkills}" varStatus="loop">
                            ${skill}
                            <c:if test="${!loop.last}">,</c:if>
                        </c:forEach>
                    </td>
                    <td>${employee.employeeAge}</td>
                    <td>${employee.employeeSalary}</td>
                    <td>${employee.employeeBirthDate}</td>
                    <td>
                        <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                        <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="<%= request.getContextPath() %>/addEmployee.jsp">Add Employee</a>
</body>
</html> --%>
   
 <%--  
  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h2>Employee List</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Birth Date</th>
            <th>Skills</th>
        </tr>
        <c:forEach var="employee" items="${employeeList}">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.employeeAge}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeeBirthDate}</td>
                <td>${employee.employeeSkills}</td>
                <td>
                        <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                        <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                    </td>
            </tr>
        </c:forEach>
        
    </table>
</body>
</html> --%>

<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h1>Employee List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Birth Date</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.employeeAge}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeeBirthDate}</td>
                <td>
                        <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                        <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                    </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html> --%>

<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Employees</title>
</head>
<body>
    <h2>List of Employees</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Birth Date</th>
            <th>Skills</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
               <td>${employee.employeeSkills}</td>
                <td>${employee.employeeAge}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeeBirthDate}</td>
	                <td>
	                    <c:forEach var="skill" items="${employee.employeeSkills.employeeSkills}">
	                        ${skill}<c:if test="${!skill.last}">, </c:if>
	                    </c:forEach>
	                </td>
	                 <td>
                        <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                        <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                    </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html> --%>

<%-- 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Employees</title>
</head>
<body>
    <h2>List of Employees</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Skills</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Birth Date</th>
            <th>Action</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
                <td>
            <c:forEach var="skill" items="${employee.employeeSkills}">
                ${skill}<c:if test="${!skill.last}">, </c:if>
            </c:forEach>
        </td>
                <td>${employee.employeeAge}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeeBirthDate}</td>
                <td>
                    <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                    <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="<%= request.getContextPath() %>/addEmployee.jsp">Add Employee</a>
</body>
</html>


 --%>
 
 
 
 <%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Employees</title>
</head>
<body>
    <h2>List of Employees</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Skills</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Birth Date</th>
            <th>Action</th>
            </tr>
        
        <tbody>
            <c:set var="counter" value="0"/>
            <c:forEach var="employee" items="${employees}">
                <c:set var="counter" value="${counter + 1}" />
                <tr>
                    <td>${counter}</td>
                    <td>${employee.employeeName}</td>
                <td>
                <c:forEach var="skill" items="${employee.getEmployeeSkills().getEmployeeSkills()}" varStatus="loop">
    				${skill}<c:if test="${!loop.last}">, </c:if>
				</c:forEach>
                </td>
                <td>${employee.employeeAge}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeeBirthDate}</td>
                <td>
                    <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                    <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                </td>
            </tr>
        <%
        System.out.println("Rendered Employee: " + employees);
        System.out.println("Rendered EmployeeSkills: " + employee.getEmployeeSkills());
    	%>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="<%= request.getContextPath() %>/addEmployee.jsp">Add Employee</a>
</body>
</html> --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Employees</title>
</head>
<body>
    <h2>List of Employees</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Skills</th>
                <th>Age</th>
                <th>Salary</th>
                <th>Birth Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="employee" items="${employees}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${employee.employeeName}</td>
                    <td>
                        <c:forEach var="skill" items="${employee.getEmployeeSkills().getEmployeeSkills()}" varStatus="innerLoop">
                            ${skill}<c:if test="${!innerLoop.last}">, </c:if>
                        </c:forEach>
                    </td>
                    <td>${employee.employeeAge}</td>
                    <td>${employee.employeeSalary}</td>
                    <td>${employee.employeeBirthDate}</td>
                    <td>
                        <a href="<%= request.getContextPath() %>/employee?action=showUpdateForm&id=${employee.employeeId}">Update</a>
                        <a href="<%= request.getContextPath() %>/employee?action=delete&id=${employee.employeeId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="<%= request.getContextPath() %>/addEmployee.jsp">Add Employee</a>
</body>
</html>

 

 
 