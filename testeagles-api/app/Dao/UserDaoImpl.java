package Dao;

import java.util.*;

import javax.persistence.EntityManager;

import lib.EntityManagerHelper;
import model.User;

import play.mvc.BodyParser;
import play.mvc.Controller;

import com.fasterxml.jackson.databind.JsonNode;

public class UserDaoImpl implements UserDao {

    public List<User> users;
    private EntityManager em;
    EntityManagerHelper emp = new EntityManagerHelper();


    @Override
    public boolean isValidUser(String username, String password) {
        // TODO Auto-generated method stub
        try {
            em = emp.getEntityManager();
            User user = (User) em.createQuery("select u from User u where u.username = :username")
                    .setParameter("username", username)
                    .getSingleResult();

            return password.equals(user.getPassword());
        } catch (Exception ex) {
            return false;
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }


}
