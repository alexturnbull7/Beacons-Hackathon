package model;

import javax.persistence.*;

/**
 * Created by stevenc on 11/04/15.
 */

@Entity
@Table(name = "ibeacon")
public class Beacon {

    public Beacon() {};

    @Id
    @GeneratedValue
    @Column(name = "id")
    private int id;
    private int majorid;
    private int minorid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMajorid() {
		return majorid;
	}
	public void setMajorid(int majorid) {
		this.majorid = majorid;
	}
	public int getMinorid() {
		return minorid;
	}
	public void setMinorid(int minorid) {
		this.minorid = minorid;
	}
    
    
}
