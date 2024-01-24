package com.employeecrud.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.employeecrud.model.Employee;
import com.employeecrud.service.EmployeeService;
import com.employeecrud.service.EmployeeServiceImpl;

public class EmployeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeService employeeService = new EmployeeServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "list":
                listEmployees(request, response);
                break;
            case "showAddForm":
                showAddForm(request, response);
                break;
            case "add":
                addEmployee(request, response);
                break;
            case "showUpdateForm":
                showUpdateForm(request, response);
                break;
            case "update":
                updateEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                listEmployees(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        	this.doGet(request, response);
    }

    private void listEmployees(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	        List<Employee> employees = employeeService.getAllEmployees();
	        request.setAttribute("employees", employees);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/listEmployee.jsp");
	        dispatcher.forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/addEmployee.jsp");
	        dispatcher.forward(request, response);
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("employeeName");
            String[] skillsArray = request.getParameterValues("employeeSkills");
            Set<String> skills = (skillsArray != null && skillsArray.length > 0) ? new HashSet<>(Arrays.asList(skillsArray)) : Collections.emptySet();
            String ageParam = request.getParameter("employeeAge");
            int age = (ageParam != null && !ageParam.isEmpty()) ? Integer.parseInt(ageParam) : 0;
            int salary = Integer.parseInt(request.getParameter("employeeSalary"));
            String birthDate = request.getParameter("employeeBirthDate");
            if (age < 18 || age > 65) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date currentDate = new Date();
            Date birthDateObj = sdf.parse(birthDate);
            if (birthDateObj.after(currentDate)) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            Employee newEmployee = new Employee(name, skills, age, salary, birthDate);
            employeeService.addEmployee(newEmployee);
            response.sendRedirect(request.getContextPath() + "/employee?action=list");
	        } catch (NumberFormatException | ParseException e) {
	            e.printStackTrace();
	            response.sendRedirect(request.getContextPath() + "/error.jsp");
	        }
    }
    
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	        int employeeId = Integer.parseInt(request.getParameter("id"));
	        Employee employee = employeeService.getEmployeeById(employeeId);
	        request.setAttribute("employee", employee);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/addEmployee.jsp");
	        dispatcher.forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int employeeId = Integer.parseInt(request.getParameter("employeeId"));
            String name = request.getParameter("employeeName");
            String[] skillsArray = request.getParameterValues("employeeSkills");
            Set<String> skills = (skillsArray != null) ? new HashSet<>(Arrays.asList(skillsArray)) : Collections.emptySet();
            int age = Integer.parseInt(request.getParameter("employeeAge"));
            int salary = Integer.parseInt(request.getParameter("employeeSalary"));
            String birthDate = request.getParameter("employeeBirthDate");
            if (age < 18 || age > 65) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date currentDate = new Date();
            Date birthDateObj = sdf.parse(birthDate);

            if (birthDateObj.after(currentDate)) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            Employee updatedEmployee = new Employee(employeeId, name, skills, age, salary, birthDate);
            employeeService.updateEmployee(updatedEmployee);
            response.sendRedirect(request.getContextPath() + "/employee?action=list");
        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(employeeId);
        response.sendRedirect(request.getContextPath() + "/employee?action=list");
    }
}