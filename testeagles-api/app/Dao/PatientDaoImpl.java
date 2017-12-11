package Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import play.mvc.BodyParser;
import play.mvc.Controller;

import com.fasterxml.jackson.databind.JsonNode;

import lib.EntityManagerHelper;
import model.*;

public class PatientDaoImpl implements PatientDao {

    public List<Patient> patients;
    private EntityManager em;
    EntityManagerHelper emp = new EntityManagerHelper();

    @Override
    public List<Patient> getPatientByName(String name) {
        try {
            em = emp.getEntityManager();
            List<Patient> patients = new ArrayList<Patient>(em.createQuery("from Patient p where p.name LIKE :name", Patient.class)
                    .setParameter("name", "%" + name + "%")
                    .getResultList());

            return patients;
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }

        return new ArrayList<Patient>();
    }

    @Override
    public Patient getPatientById(int id) {
    	try {
	        em = emp.getEntityManager();
	        return em.find(Patient.class, Integer.valueOf(id));
    	} catch(Exception ex) {
    		System.out.println(ex.toString());
    	}
    	finally {
    		if (em.isOpen()) {
    			em.close();
    		}
    	}
    	return new Patient();
    }

    @Override
    public Patient findPatientByBeaconId(int majorId, int minorId) {

        try {
            em = emp.getEntityManager();
            Bed b = (Bed) em.createQuery(
                    "FROM Bed b where (b.beacon.majorid = :majorid AND b.beacon.minorid = :minorid)")
                    .setParameter("majorid", majorId)
                    .setParameter("minorid", minorId)
                    .getSingleResult();

            return b.getPatient();
        } catch (Exception ex) {
            System.out.println(ex.getCause());
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }

        return null;
    }

    @BodyParser.Of(BodyParser.Json.class)
	@Override
	public void addNote(int id) {
		// TODO Auto-generated method stub
		JsonNode jsonNode = Controller.request().body().asJson();
		try {
			em = emp.getEntityManager();
			PatientNotes note = new PatientNotes();
			note.setNote(jsonNode.findPath("note").asText());
			note.setPatient(em.find(Patient.class, id));
			
			em.persist(note);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		finally {
			if (em.isOpen()) {
				em.close();
			}
		}
		
	}
}

