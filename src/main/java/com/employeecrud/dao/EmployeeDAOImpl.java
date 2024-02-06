package com.employeecrud.dao;
	
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
	
import com.employeecrud.model.Employee;
import com.employeecrud.model.EmployeeSkills;
import com.employeecrud.util.DBUtil;
	
	public class EmployeeDAOImpl implements EmployeeDAO {
		int generateId;
		private static final String SELECT_ALL_EMPLOYEES = "SELECT employeeDetails.employeeId AS employeeId, employeeDetails.employeeName, employeeDetails.employeeAge, employeeDetails.employeeSalary, employeeDetails.employeeBirthDate,employeeSkill.employeeSkillId, employeeSkill.employeeSkills FROM employeeDetails Left JOIN employeeSkill ON employeeDetails.employeeId = employeeSkill.employeeId;";
		private static final String SELECT_EMPLOYEE_BY_ID = "SELECT employeeDetails.employeeId, " +
		        "employeeDetails.employeeName, employeeDetails.employeeAge, " +
		        "employeeDetails.employeeSalary, employeeDetails.employeeBirthDate, " +
		        "employeeSkill.employeeSkillId, employeeSkill.employeeSkills " +
		        "FROM employeeDetails " +
		        "Left JOIN employeeSkill ON employeeDetails.employeeId = employeeSkill.employeeId " +
		        "WHERE employeeDetails.employeeId = ?";
	
		private static final String INSERT_EMPLOYEE = "INSERT INTO employeeDetails (employeeName, employeeAge, employeeSalary, employeeBirthDate) VALUES (?, ?, ?, ?)";
	    private static final String UPDATE_EMPLOYEE = "UPDATE employeeDetails SET employeeName=?, employeeAge=?, employeeSalary=?, employeeBirthDate=? WHERE employeeId=?";
	    private static final String DELETE_EMPLOYEE = "DELETE FROM employeeDetails WHERE employeeId=?";
	
	    // EmployeeSkills queries
	    private static final String INSERT_EMPLOYEESKILL = "INSERT INTO employeeSkill (employeeSkills, employeeId) VALUES (?, ?)";
	    private static final String DELETE_EMPLOYEESKILL = "DELETE FROM employeeSkill WHERE employeeId = ? AND employeeSkills = ?";
	    private static final String SELECT_EMPLOYEE_SKILLS_BY_EMPLOYEE_ID = "SELECT employeeSkills FROM employeeSkill WHERE employeeId=?";
	
	    @Override
	    public List<Employee> getAllEmployees() {
	        List<Employee> employees = new ArrayList<>();
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);
	             ResultSet resultSet = preparedStatement.executeQuery()) {
	            Map<Integer, Employee> employeeMap = new HashMap<>();
	            while (resultSet.next()) {
	                int employeeId = resultSet.getInt("employeeId");
	                Employee employee = employeeMap.get(employeeId);

	                if (employee == null) {
	                    employee = mapResultSetToEmployee(resultSet);
	                    employee.setEmployeeSkills(new EmployeeSkills());
	                    employeeMap.put(employeeId, employee);
	                    employees.add(employee);
	                }
	                EmployeeSkills employeeSkills = employee.getEmployeeSkills();
	                employeeSkills.setEmployeeSkillId(resultSet.getInt("employeeSkillId"));
	                employeeSkills.setEmployeeId(employeeId);
	                String skillsColumnValue = resultSet.getString("employeeSkills");
	                if (skillsColumnValue != null) {
	                    Set<String> skills = new HashSet<>(Arrays.asList(skillsColumnValue.split(",")));
	                    employeeSkills.getEmployeeSkills().addAll(skills);
	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return employees;
	    }
	    
	    @Override
	    public Employee getEmployeeById(int id) {
	        Employee employee = null;
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
	            preparedStatement.setInt(1, id);
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    employee = mapResultSetToEmployee(resultSet);
	                    EmployeeSkills employeeSkills = new EmployeeSkills();
	                    employeeSkills.setEmployeeSkillId(resultSet.getInt("employeeSkillId"));
	                    employeeSkills.setEmployeeId(id);
	                    String skillsColumnValue = resultSet.getString("employeeSkills");
	                    Set<String> skills = new HashSet<>();
	                    if (skillsColumnValue != null) {
	                        skills.addAll(Arrays.asList(skillsColumnValue.split(",")));
	                    }
	                    employeeSkills.getEmployeeSkills().addAll(skills);
	                    employee.setEmployeeSkills(employeeSkills);
	                }
	            }
	        } catch (SQLException | NullPointerException e) {
	            e.printStackTrace();
	        }
	        return employee;
	    }

	    @Override
	    public void addEmployee(Employee employee) {
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE, Statement.RETURN_GENERATED_KEYS)) {
	            preparedStatement.setString(1, employee.getEmployeeName());
	            preparedStatement.setInt(2, employee.getEmployeeAge());
	            preparedStatement.setInt(3, employee.getEmployeeSalary());
	            preparedStatement.setString(4, employee.getEmployeeBirthDate());
	            int affectedRows = preparedStatement.executeUpdate();
	            if (affectedRows > 0) {
	                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
	                    if (generatedKeys.next()) {
	                        generateId = generatedKeys.getInt(1);
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	
	    @Override
	    public void addEmployeeSkills(EmployeeSkills employeeSkills) {
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEESKILL)) {
	            for (String skill : employeeSkills.getEmployeeSkills()) {
	                preparedStatement.setString(1, skill);
	                preparedStatement.setInt(2, generateId);
	                preparedStatement.addBatch();
	            }
	            preparedStatement.executeBatch();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
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
	
	    @Override
	    public void updateEmployee(Employee employee) {
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE)) {
	            preparedStatement.setString(1, employee.getEmployeeName());
	            preparedStatement.setInt(2, employee.getEmployeeAge());
	            preparedStatement.setInt(3, employee.getEmployeeSalary());
	            preparedStatement.setString(4, employee.getEmployeeBirthDate());
	            preparedStatement.setInt(5, employee.getEmployeeId());
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    @Override
	    public void updateEmployeeSkills(EmployeeSkills employeeSkills) {
	        try (Connection connection = DBUtil.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEESKILL)) {
	        	preparedStatement.setString(1, String.join(",", employeeSkills.getEmployeeSkills()));
	        	preparedStatement.setInt(2, employeeSkills.getEmployeeId());
	        	preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	   
	    public Set<String> getEmployeeSkillsByEmployeeId(int employeeId) {
	        Set<String> employeeSkills = new HashSet<>();
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_SKILLS_BY_EMPLOYEE_ID)) {
	            preparedStatement.setInt(1, employeeId);
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    employeeSkills.addAll(Arrays.asList(resultSet.getString("employeeSkills").split(",")));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return employeeSkills;
	    }
	
	    @Override
	    public void deleteEmployeeSkills(int employeeId, String skill) {
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEESKILL)) {
	            preparedStatement.setInt(1, employeeId);
	            preparedStatement.setString(2, skill);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    	    
	    private Employee mapResultSetToEmployee(ResultSet resultSet) throws SQLException {
	        int employeeId = resultSet.getInt("employeeId");
	        String employeeName = resultSet.getString("employeeName");
	        int employeeAge = resultSet.getInt("employeeAge");
	        int employeeSalary = resultSet.getInt("employeeSalary");
	        String employeeBirthDate = resultSet.getString("employeeBirthDate");
	        return new Employee(employeeId, employeeName, employeeAge, employeeSalary, employeeBirthDate);
	    }
	}
