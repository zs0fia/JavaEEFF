package Repositories;

import Models.Hero;
import Models.Hybrid;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class HeroRepository {
    public static final HeroRepository instance = new HeroRepository();
    
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    private List<Hero> heroes = new ArrayList<>();
    public HeroRepository() {}
    
    public List<Hero> getHeroes(){
        return em.createQuery("SELECT * FROM Hero h", Hero.class).getResultList();
    }
    
    public void addHero(Hero pValue){
        em.getTransaction().begin();
        for (Hybrid h : pValue.getHybrid()) {
            em.persist(h);
        }
        em.persist(pValue);
        em.getTransaction().commit();
    }
}
