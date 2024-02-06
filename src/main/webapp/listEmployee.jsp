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
					        <c:out value="${skill}" />
					        <c:if test="${!innerLoop.last}">, </c:if>
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