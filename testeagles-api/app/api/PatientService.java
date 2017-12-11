package api;

import Dao.PatientDao;
import Dao.PatientDaoImpl;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;

/**
 * Created by stevenc on 11/04/15.
 */
public class PatientService extends Controller{

	public static Result getPatientByName(String name) {
		PatientDao patientDao = new PatientDaoImpl();
		return ok(Json.toJson(patientDao.getPatientByName(name)));
	}

	public static Result getPatientById(int id) {
		PatientDao patientDao = new PatientDaoImpl();
		return ok(Json.toJson(patientDao.getPatientById(id)));
	}


    public static Result getPatientByBeaconId(int majorId, int minorId) {
        PatientDao patientDao = new PatientDaoImpl();

        return ok(Json.toJson(patientDao.findPatientByBeaconId(majorId, minorId)));
    }
    
    public static Result addNote(int id) {
    	PatientDao patientDao = new PatientDaoImpl();
    	patientDao.addNote(id);
    	return ok(Json.toJson("Success"));
    }
}
