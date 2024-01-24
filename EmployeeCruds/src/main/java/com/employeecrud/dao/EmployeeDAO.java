package com.employeecrud.dao;

import java.util.List;
import com.employeecrud.model.Employee;

public interface EmployeeDAO {
    List<Employee> getAllEmployees();
    Employee getEmployeeById(int id);
    void addEmployee(Employee employee);
    void updateEmployee(Employee employee);
    void deleteEmployee(int id);
}