package com.employeecrud.service;

import java.util.List;
import java.util.Set;

import com.employeecrud.model.Employee;
import com.employeecrud.model.EmployeeSkills;

public interface EmployeeService {
	
    List<Employee> getAllEmployees();
    
    Employee getEmployeeById(int id);
    
    void addEmployee(Employee employee);
    
    void updateEmployee(Employee employee);
    
    void deleteEmployee(int id);
    
    Set<String> getEmployeeSkillsByEmployeeId(int employeeId);
    
    void addEmployeeSkills(EmployeeSkills employeeSkills);
    
    void updateEmployeeSkills(EmployeeSkills employeeSkills);
    
    void deleteEmployeeSkills(int esid);
    
}