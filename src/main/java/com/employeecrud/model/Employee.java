package com.employeecrud.model;

public class Employee {
    private int employeeId;
    private String employeeName;
    private int employeeAge;
    private int employeeSalary;
    private String employeeBirthDate;
    private EmployeeSkills employeeSkills;

	public Employee(EmployeeSkills employeeSkills) {
		this.employeeSkills = employeeSkills;
	}
	
	// Adding a new employee
    public Employee(String employeeName, int employeeAge, int employeeSalary, String employeeBirthDate) {
        this.employeeName = employeeName;
        this.employeeAge = employeeAge;
        this.employeeSalary = employeeSalary;
        this.employeeBirthDate = employeeBirthDate;
    }

    // Updating an existing employee
    public Employee(int employeeId, String employeeName, int employeeAge, int employeeSalary, String employeeBirthDate) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeAge = employeeAge;
        this.employeeSalary = employeeSalary;
        this.employeeBirthDate = employeeBirthDate;
    }

	// Getters and Setters
    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
   
    public EmployeeSkills getEmployeeSkills() {
        return employeeSkills;
    }

    public void setEmployeeSkills(EmployeeSkills employeeSkills) {
        this.employeeSkills = employeeSkills;
    }

    public int getEmployeeAge() {
        return employeeAge;
    }

    public void setEmployeeAge(int employeeAge) {
        this.employeeAge = employeeAge;
    }

    public int getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(int employeeSalary) {
        this.employeeSalary = employeeSalary;
    }

    public String getEmployeeBirthDate() {
        return employeeBirthDate;
    }

    public void setEmployeeBirthDate(String employeeBirthDate) {
        this.employeeBirthDate = employeeBirthDate;
    }

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeAge=" + employeeAge
				+ ", employeeSalary=" + employeeSalary + ", employeeBirthDate=" + employeeBirthDate
				+ ", employeeSkills=" + employeeSkills + "]";
	}	
}