package Dao;

import java.util.List;

import play.mvc.BodyParser;
import model.Patient;
import model.PatientNotes;
import model.Patient;

/**
 * Created by stevenc on 11/04/15.
 */
public interface PatientDao {

	List<Patient> getPatientByName(String name);
	Patient getPatientById(int id);
    Patient findPatientByBeaconId(int majorId, int minorId);
    @BodyParser.Of(BodyParser.Json.class)
    void addNote(int id);
}
