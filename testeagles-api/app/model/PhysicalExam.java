package model;

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
@Table(name = "physicalexam")
public class PhysicalExam {
	
	public PhysicalExam() {};

	@Id @GeneratedValue
	@Column(name = "id")
	private int id;
	
	private String genapperance;
	private String eyes;
	private String earsnosemouth;
	private String respiratory;
	private String cardiovascular;
	private String skin;
	private String problem;
	
	@JsonIgnore
	@ManyToOne(targetEntity = Patient.class)
	@JoinColumn(name="patientid")
	private Patient patient;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGenapperance() {
		return genapperance;
	}

	public void setGenapperance(String genapperance) {
		this.genapperance = genapperance;
	}

	public String getEyes() {
		return eyes;
	}

	public void setEyes(String eyes) {
		this.eyes = eyes;
	}

	public String getEarsnosemouth() {
		return earsnosemouth;
	}

	public void setEarsnosemouth(String earsnosemouth) {
		this.earsnosemouth = earsnosemouth;
	}

	public String getRespiratory() {
		return respiratory;
	}

	public void setRespiratory(String respiratory) {
		this.respiratory = respiratory;
	}

	public String getCardiovascular() {
		return cardiovascular;
	}

	public void setCardiovascular(String cardiovascular) {
		this.cardiovascular = cardiovascular;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	
	
	
}
