package com.employeecrud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import com.employeecrud.model.Employee;
import com.employeecrud.util.DBUtil;

public class EmployeeDAOImpl implements EmployeeDAO {
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employeeDetails";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employeeDetails WHERE employeeId = ?";
    private static final String INSERT_EMPLOYEE = "INSERT INTO employeeDetails (employeeName, employeeSkills, employeeAge, employeeSalary, employeeBirthDate) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_EMPLOYEE = "UPDATE employeeDetails SET employeeName=?, employeeSkills=?, employeeAge=?, employeeSalary=?, employeeBirthDate=? WHERE employeeId=?";
    private static final String DELETE_EMPLOYEE = "DELETE FROM employeeDetails WHERE employeeId=?";
    
    //getAllEmployees
    @Override
    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
             Employee employee = mapResultSetToEmployee(resultSet);
             employees.add(employee);
            }
        } catch (SQLException e) {
             e.printStackTrace();
        }
        return employees;
    }
    
    //getEmployeeById
    @Override
    public Employee getEmployeeById(int id) {
        Employee employee = null;
        try (Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    employee = mapResultSetToEmployee(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
    
    //addEmployee
    @Override
    public void addEmployee(Employee employee) {
        try (Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, String.join(",", employee.getEmployeeSkills()));
            preparedStatement.setInt(3, employee.getEmployeeAge());
            preparedStatement.setInt(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeeBirthDate());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //updateEmployee
    @Override
    public void updateEmployee(Employee employee) {
        try (Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, String.join(",", employee.getEmployeeSkills()));
            preparedStatement.setInt(3, employee.getEmployeeAge());
            preparedStatement.setInt(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeeBirthDate());
            preparedStatement.setInt(6, employee.getEmployeeId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //deleteEmployee
    @Override
    public void deleteEmployee(int id) {
        try (Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Employee mapResultSetToEmployee(ResultSet resultSet) throws SQLException {
        int employeeId = resultSet.getInt("employeeId");
        String employeeName = resultSet.getString("employeeName");
        Set<String> employeeSkills = new HashSet<>(Arrays.asList(resultSet.getString("employeeSkills").split(",")));
        int employeeAge = resultSet.getInt("employeeAge");
        int employeeSalary = resultSet.getInt("employeeSalary");
        String employeeBirthDate = resultSet.getString("employeeBirthDate");
        return new Employee(employeeId, employeeName, employeeSkills, employeeAge, employeeSalary, employeeBirthDate);
    }
}

