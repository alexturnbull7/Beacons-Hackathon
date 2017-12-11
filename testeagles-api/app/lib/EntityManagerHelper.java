package lib;

import javax.persistence.EntityManager;
import play.db.jpa.JPA;

public class EntityManagerHelper {
	
	private static EntityManager em;
	
	public EntityManager getEntityManager() {
		if (em == null) {
		   return JPA.em("default");
		}
		else  {
			return em;
		}
	}

}
