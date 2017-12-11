package model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by stevenc on 11/04/15.
 */

@Entity
@Table(name = "bed")
public class Bed {

    @Id
    @GeneratedValue
    private int id;
    
    @JsonIgnore
    @OneToOne(targetEntity = Ward.class)
    @JoinColumn(name="wardid")
    private Ward ward;

    @JsonIgnore
    @OneToOne(targetEntity = Patient.class)
    @JoinColumn(name="patientid")
    private Patient patient;
    
    @JsonIgnore
    @OneToOne(targetEntity = Beacon.class)
    @JoinColumn(name="beaconid")
    private Beacon beacon;

    public Bed() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    

    public Ward getWard() {
		return ward;
	}

	public void setWard(Ward ward) {
		this.ward = ward;
	}

	public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

	public Beacon getBeacon() {
		return beacon;
	}

	public void setBeacon(Beacon beacon) {
		this.beacon = beacon;
	}



}
