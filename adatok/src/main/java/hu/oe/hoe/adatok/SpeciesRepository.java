package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class SpeciesRepository {
    public static final SpeciesRepository instance = new SpeciesRepository();
    
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();

    public SpeciesRepository() {
        add(new Species("Ember", "okos"));
        add(new Species("Torpe", "kicsi"));
        add(new Species("Tunde", "szép"));
    }

    public List<Species> getSpecies() {
        return em.createQuery("SELECT s FROM Species s", Species.class).getResultList();
    }
    
    public void add(Species pValue){
        
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
        
        //this.species.add(pValue);
    }
}
