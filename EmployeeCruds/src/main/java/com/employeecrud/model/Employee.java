package com.employeecrud.model;

import java.util.Set;

public class Employee {
    private static int lastAssignedId = 0;

    private int employeeId;
    private String employeeName;
    private Set<String> employeeSkills;
    private int employeeAge;
    private int employeeSalary;
    private String employeeBirthDate;

    // Adding a new employee
    public Employee(String employeeName, Set<String> employeeSkills, int employeeAge, int employeeSalary, String employeeBirthDate) {
        this.employeeId = ++lastAssignedId;
        this.employeeName = employeeName;
        this.employeeSkills = employeeSkills;
        this.employeeAge = employeeAge;
        this.employeeSalary = employeeSalary;
        this.employeeBirthDate = employeeBirthDate;
    }

    // Updating an existing employee
    public Employee(int employeeId, String employeeName, Set<String> employeeSkills, int employeeAge, int employeeSalary, String employeeBirthDate) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeSkills = employeeSkills;
        this.employeeAge = employeeAge;
        this.employeeSalary = employeeSalary;
        this.employeeBirthDate = employeeBirthDate;

        // Update lastAssignedId if needed
        if (employeeId > lastAssignedId) {
            lastAssignedId = employeeId;
        }
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

    public Set<String> getEmployeeSkills() {
        return employeeSkills;
    }

    public void setEmployeeSkills(Set<String> employeeSkills) {
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
        return "Employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeSkills="
                + employeeSkills + ", employeeAge=" + employeeAge + ", employeeSalary=" + employeeSalary
                + ", employeeBirthDate=" + employeeBirthDate + "]";
    }
}