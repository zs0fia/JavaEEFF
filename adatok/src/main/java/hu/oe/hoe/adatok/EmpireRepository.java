/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class EmpireRepository {
    public static final EmpireRepository instance = new EmpireRepository();
    
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    private List<Empire> empires = new ArrayList<>();
    
    public void addEmpire(Empire pValue){
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
    }
    
    public List<Empire> getEmpires(){
        return em.createQuery("SELECT e FROM Empire e", Empire.class).getResultList();
    }
    
}
