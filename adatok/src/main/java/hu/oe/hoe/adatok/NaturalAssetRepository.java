/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Persistence;

/**
 *
 * @author javaee
 */
public class NaturalAssetRepository {
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    public static final NaturalAssetRepository  instance = new NaturalAssetRepository();
    
    private List<NaturalAsset> naturals = new ArrayList<>();

    public NaturalAssetRepository() {
        addNatural(new NaturalAsset("fa", "fák kivágásával nyerhető"));
        addNatural(new NaturalAsset("kő", "bányászattal nyerhető"));
        addNatural(new NaturalAsset("arany", "bányászattal nyerhető"));       
    }
    
    public void addNatural(NaturalAsset pValue){
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
    }

    public List<NaturalAsset> getNaturals() {
        return em.createQuery("SELECT n FROM NaturalAsset n", NaturalAsset.class).getResultList();
    }
}
