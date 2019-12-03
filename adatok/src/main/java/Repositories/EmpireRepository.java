/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repositories;

import Models.Building;
import Models.Empire;
import Models.Stock;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class EmpireRepository {
    public static final EmpireRepository instance = new EmpireRepository();
    
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    private List<Empire> empires = new ArrayList<>();
    public EmpireRepository(){}
    
    public void addEmpire(Empire pValue){
        em.getTransaction().begin();
//        for(Stock s: pValue.getProduce()){
//            em.persist(s);
//        }
        em.persist(pValue);
        em.getTransaction().commit();
    }
    
    public List<Empire> getEmpires(){
        return em.createQuery("SELECT e FROM Empire e", Empire.class).getResultList();
    }
    
//    public List<Empire> searchEmpires(Long UserID,String name, String description)//, Stock minimalwh, Building building )
//    {
//        CriteriaBuilder cb = em.getCriteriaBuilder();
//        CriteriaQuery cq = cb.createQuery(Empire.class);
//        Root rt = cq.from(Empire.class);
//        List<Predicate> preds = new ArrayList<>();
//        preds.add(cb.equal(rt.get("user"), UserID));
//        
//        if(name != null){
//        preds.add(cb.like(rt.get("name"), "%"+name+"%"));
//        }
//         
//        if(name != null){
//        preds.add(cb.like(rt.get("description"), "%"+description+"%"));
//        }
//        
////        if(minimalwh != null){
////        Join<Empire,Stock> stock = rt.join("warehouse");
////        
////        }
////        if(building != null)
////        {
////        Join<Empire, Building> bld = rt.join("buildings");
////        }
//        cq.select(rt);              
//                  
//        cq.select(rt).where(preds.toArray(new Predicate[]{}));
//        
//        Object result = em.createQuery(cq).getResultList();
//        if( result  != null ){
//            return (List<Empire>) result;
//        }
//        
//        return null;
//    }
}
