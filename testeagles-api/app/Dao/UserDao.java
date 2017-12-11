package Dao;

import java.util.List;

import play.mvc.BodyParser;
import model.User;

public interface UserDao {

	boolean isValidUser(String username, String password);
}
