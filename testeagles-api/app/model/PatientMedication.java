package model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "patientmedication")
public class PatientMedication {
	
	public PatientMedication() {};
	
	@Id @GeneratedValue
	@Column(name = "id")
	private int id;
	
	@JsonIgnore
	@ManyToOne(targetEntity = Patient.class)
	@JoinColumn(name="patientid")
	private Patient patient;
	
	@OneToOne(targetEntity = Medication.class)
	@JoinColumn(name="medicationid")
	private Medication medication;
	
	private Timestamp timetotake;
	private String dosage;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public Medication getMedication() {
		return medication;
	}
	public void setMedication(Medication medication) {
		this.medication = medication;
	}
	public Timestamp getTimetotake() {
		return timetotake;
	}
	public void setTimetotake(Timestamp timetotake) {
		this.timetotake = timetotake;
	}
	public String getDosage() {
		return dosage;
	}
	public void setDosage(String dosage) {
		this.dosage = dosage;
	}
	
	

}
