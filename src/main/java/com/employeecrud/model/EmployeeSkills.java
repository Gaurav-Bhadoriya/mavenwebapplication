package com.employeecrud.model;

import java.util.HashSet;
import java.util.Set;

public class EmployeeSkills {
	
	private int employeeSkillId;
	private Set<String> employeeSkills;
	private int employeeId;
	
	public int getEmployeeSkillId() {
		return employeeSkillId;
	}

	public void setEmployeeSkillId(int employeeSkillId) {
		this.employeeSkillId = employeeSkillId;
	}

	public Set<String> getEmployeeSkills() {
		return employeeSkills;
	}

	public void setEmployeeSkills(Set<String> employeeSkills) {
		this.employeeSkills = employeeSkills;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	// Parameterized constructor
	public EmployeeSkills(int employeeSkillId, Set<String> employeeSkills, int employeeId) {
		super();
		this.employeeSkillId = employeeSkillId;
		this.employeeSkills = employeeSkills;
		this.employeeId = employeeId;
	}

	// Default constructor
	public EmployeeSkills() {
		this.employeeSkills = new HashSet<>();
	}

	// Additional constructor for creating with just skills
	public EmployeeSkills(Set<String> employeeSkills) {
		super();
		this.employeeSkills = employeeSkills;
	}
	
	public void addSkill(String skill) {
		this.employeeSkills.add(skill);
	}
}