package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class HeroRepository {
    public static final HeroRepository instance = new HeroRepository();
    
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    private List<Hero> heroes = new ArrayList<>();
    
    public List<Hero> getHeroes(){
        return em.createQuery("SELECT * FROM Hero h", Hero.class).getResultList();
    }
    
    public void addHero(Hero pValue){
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
    }
}
