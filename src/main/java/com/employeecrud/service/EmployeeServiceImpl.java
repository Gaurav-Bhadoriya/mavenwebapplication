package com.employeecrud.service;
import java.util.List;
import java.util.Set;

import com.employeecrud.dao.EmployeeDAO;
import com.employeecrud.dao.EmployeeDAOImpl;
import com.employeecrud.model.Employee;
import com.employeecrud.model.EmployeeSkills;

public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeDAO employeeDAO = new EmployeeDAOImpl();
    
    @Override
    public List<Employee> getAllEmployees() {
        return employeeDAO.getAllEmployees();
    }
    
    @Override
    public Employee getEmployeeById(int id) {
        return employeeDAO.getEmployeeById(id);
    }
    
    @Override
    public void addEmployee(Employee employee) {
        employeeDAO.addEmployee(employee);
    }
    
    @Override
    public void updateEmployee(Employee employee) {
        employeeDAO.updateEmployee(employee);
    }
    
    @Override
    public void deleteEmployee(int id) {
        employeeDAO.deleteEmployee(id);
    }

	@Override
	public void addEmployeeSkills(EmployeeSkills employeeSkills) {
		  employeeDAO.addEmployeeSkills(employeeSkills);
		
	}

	@Override
	public void updateEmployeeSkills(EmployeeSkills employeeSkills) {
		 employeeDAO.updateEmployeeSkills(employeeSkills);
		
	}

	@Override
	public void deleteEmployeeSkills(int id) {
		employeeDAO.deleteEmployeeSkills(id, null);
	}
	
	@Override
	    public Set<String> getEmployeeSkillsByEmployeeId(int employeeId) {
	        return employeeDAO.getEmployeeSkillsByEmployeeId(employeeId);
	    }
	}


