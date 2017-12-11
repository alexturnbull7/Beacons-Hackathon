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
@Table(name = "PatientAlergy")
public class PatientAlergy {
	
	public PatientAlergy() {};
	
	@Id @GeneratedValue
	@Column(name = "id")
	private int id;
	
	
	@OneToOne(targetEntity = Alergy.class)
	@JoinColumn(name="alergyid")
	private Alergy alergy;
	
	@JsonIgnore
	@ManyToOne(targetEntity = Patient.class)
	@JoinColumn(name="patientid")
	private Patient patient;
	
	private int severness;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Alergy getAlergy() {
		return alergy;
	}

	public void setAlergy(Alergy alergy) {
		this.alergy = alergy;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public int getSeverness() {
		return severness;
	}

	public void setSeverness(int severness) {
		this.severness = severness;
	}
	

	
	
	

}
