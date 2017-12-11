package api;

import java.util.List;

import Dao.UserDao;
import Dao.UserDaoImpl;

import model.User; 
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;
public class UserService extends Controller {

	public static Result isValidUser(String username, String password) {
		UserDao userDao = new UserDaoImpl();
		IsValidUserResult isValidUserResult = new IsValidUserResult();
		isValidUserResult.isValidUser = userDao.isValidUser(username, password);

		return ok(Json.toJson(isValidUserResult));
	}

	static class IsValidUserResult {
		public boolean isValidUser;
	}
}
