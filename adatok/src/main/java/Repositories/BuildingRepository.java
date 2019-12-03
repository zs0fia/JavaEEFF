/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repositories;

import java.util.ArrayList;
import java.util.List;
import Models.Building;
import Models.NaturalAsset;
import Models.Stock;
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
            addBuilding(new Building("Akademia", "oktatasra szolgal", 10));
            addBuilding(new Building("Barakk", "katonak kepzese", 20));
            addBuilding(new Building("Raktar", "asvanyok tarolasara szolgal", 25));            
            addBuilding(new Building("Haz", "lakossag novelesere szolgal", 40));
            addBuilding(new Building("Istallo", "allatok tartasara szolgal", 30));
            addBuilding(new Building("Ortorony", "vedelemre szolgal", 35));
            addBuilding(new Building("Bolt", "uzletelesre szolgal", 10));
    }

    public void addBuilding(Building pValue){
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
    }
    
    public List<Building> getBuildings() {
        return em.createQuery("SELECT b FROM Building b", Building.class).getResultList();
    }
    
    public Building getBuildingById(int id) {
        //return em.find(Building.class, id);
        for (int i = 0; i < getBuildings().size(); i++) {
            if(getBuildings().get(i).getId() == id){
                return getBuildings().get(i);
            }
        }
        return new Building("b","bbb",10);
    }
}
