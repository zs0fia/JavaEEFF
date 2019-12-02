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

/**
 *
 * @author javaee
 */
public class BuildingRepository {
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    public static final BuildingRepository  instance = new BuildingRepository();
    
    private List<Building> buildings = new ArrayList<>();

    public BuildingRepository() {     
//        List<Stock> tmpCost = new ArrayList<>();
//        var naturals = NaturalAssetRepository.instance.getNaturals();
//        for (int i = 0; i < 3; i++) {
//            tmpCost.add(new Stock());  
//        }  
//        
//        tmpCost.set(0, new Stock(naturals.get(0), 150));//fa
//        tmpCost.set(1, new Stock(naturals.get(1), 80));//kő
//        tmpCost.set(2, new Stock(naturals.get(2), 10));//arany
//        addBuidling(new Building("Akadémia", "lakosok oktatására szolgál",tmpCost, 60)); //150 fa, 80 kő, 10 arany
//                
//        tmpCost.set(0, new Stock(naturals.get(0), 125));
//        tmpCost.set(1, new Stock(naturals.get(1), 30));
//        tmpCost.set(2, new Stock(naturals.get(2), 15));
//        addBuidling(new Building("Barakk", "katonák kiképzésére szolgál", tmpCost, 35)); //125 fa, 30 kő, 15 arany
//        
//        tmpCost.set(0, new Stock(naturals.get(0), 120));
//        tmpCost.set(1, new Stock(naturals.get(1), 0));
//        tmpCost.set(2, new Stock(naturals.get(2), 0));
//        addBuidling(new Building("Raktár", "ásványok tárolására szolgál", tmpCost, 30));//120 fa, 0 kő, 0 arany
//        
//        tmpCost.set(0, new Stock(naturals.get(0), 30));
//        tmpCost.set(1, new Stock(naturals.get(1), 50));
//        tmpCost.set(2, new Stock(naturals.get(2), 0));
//        addBuidling(new Building("Ház", "lakosság növelésére szolgál", tmpCost, 15));//30 fa, 50 kő, 0 arany   
//        
//        tmpCost.set(0, new Stock(naturals.get(0), 150));
//        tmpCost.set(1, new Stock(naturals.get(1), 0));
//        tmpCost.set(2, new Stock(naturals.get(2), 0));
//        addBuidling(new Building("Istálló", "állatok tartására szolgál", tmpCost, 40)); //150 fa, 0 kő, 0 arany
//        
//        tmpCost.set(0, new Stock(naturals.get(0), 120));
//        tmpCost.set(1, new Stock(naturals.get(1), 50));
//        tmpCost.set(2, new Stock(naturals.get(2), 25));
//        addBuidling(new Building("Őrtorony", "védelemre szolgál", tmpCost, 50)); //120 fa, 50 kő, 25 arany
//        
//        tmpCost.set(0, new Stock(naturals.get(0), 100));
//        tmpCost.set(1, new Stock(naturals.get(1), 30));
//        tmpCost.set(2, new Stock(naturals.get(2), 10));
//        addBuidling(new Building("Bolt", "üzletelésre szolgál", tmpCost, 30));//100 fa, 30 kő, 10 arany
    }

    public void addBuidling(Building pValue){
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
    }
    
    public List<Building> getBuildings() {
        return em.createQuery("SELECT b FROM Building b", Building.class).getResultList();
    }
}
