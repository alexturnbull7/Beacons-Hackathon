package model;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Created by stevenc on 11/04/15.
 */

@Entity
@Table(name = "patient")
public class Patient {
	
	public Patient() {};
	
	@Id @GeneratedValue
	@Column(name = "id")
	private int id;
	private String name;
	private Timestamp dob;
	private char gender;
	private Timestamp expecteddischargedate;
	
	
		
	public Timestamp getExpecteddischargedate() {
		return expecteddischargedate;
	}
	public void setExpecteddischargedate(Timestamp expecteddischargedate) {
		this.expecteddischargedate = expecteddischargedate;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy="patient")
	private Set<PatientNotes> notes;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="patient")
	private Set<PatientAlergy> patientAlergies;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="patient")
	private Set<PatientMedication> patientMedication;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="patient")
	private Set<PhysicalExam> physicalExams;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="patient")
	private Set<PatientTest> patientTests;
	
	@OneToOne(fetch = FetchType.EAGER, mappedBy="patient") 
	private Bed bed;
	

	public Set<PatientTest> getPatientTests() {
		return patientTests;
	}
	public void setPatientTests(Set<PatientTest> patientTests) {
		this.patientTests = patientTests;
	}
	public Set<PhysicalExam> getPhysicalExams() {
		return physicalExams;
	}
	public void setPhysicalExams(Set<PhysicalExam> physicalExams) {
		this.physicalExams = physicalExams;
	}
	public Set<PatientMedication> getPatientMedication() {
		return patientMedication;
	}
	public void setPatientMedication(Set<PatientMedication> patientMedication) {
		this.patientMedication = patientMedication;
	}
	public Set<PatientAlergy> getPatientAlergies() {
		return patientAlergies;
	}
	public void setPatientAlergies(Set<PatientAlergy> patientAlergies) {
		this.patientAlergies = patientAlergies;
	}
	public Set<PatientNotes> getNotes() {
		return notes;
	}
	public void setNotes(Set<PatientNotes> notes) {
		this.notes = notes;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDob() {
		return dob;
	}
	public void setDob(Timestamp dob) {
		this.dob = dob;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
	
	
	
}
