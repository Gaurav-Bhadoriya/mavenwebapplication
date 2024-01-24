<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <%-- <td>${employee.employeeId}</td> --%>
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
</html>
 