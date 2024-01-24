package com.employeecrud.service;

import java.util.List;
import com.employeecrud.model.Employee;

public interface EmployeeService {
    List<Employee> getAllEmployees();
    Employee getEmployeeById(int id);
    void addEmployee(Employee employee);
    void updateEmployee(Employee employee);
    void deleteEmployee(int id);
}