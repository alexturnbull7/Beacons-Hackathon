package model;

import javax.persistence.*;

/**
 * Created by stevenc on 11/04/15.
 */

@Entity
@Table(name = "ward")
public class Ward {

    public Ward() {};

    @Id
    @GeneratedValue
    @Column(name = "id")
    private int id;
    private String location;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
    
    
}
