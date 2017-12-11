package api;

import Dao.PatientDao;
import Dao.PatientDaoImpl;
import model.Dashboard;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;

public class DashboardService extends Controller {

    public static Result getDashboardInfo(int majorId, int minorId) {
        PatientDao patientDao = new PatientDaoImpl();
        Dashboard dashInfo = new Dashboard(patientDao.findPatientByBeaconId(majorId, minorId));
        return ok(Json.toJson(dashInfo));
    }
}
