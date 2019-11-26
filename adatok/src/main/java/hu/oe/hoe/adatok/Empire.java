/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "empire")
public class Empire implements UniqueId{
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    
    private String name;
    private String description;
    private long level;
    private List<Population> population = new ArrayList<>();
    private List<Stock> produce = new ArrayList<>();
    private List<Stock> warehouse = new ArrayList<>();
    private List<Building> buildings = new ArrayList<>();
    
    public Empire(String name, String description, long level) {
        this.name = name;
        this.description = description;
        this.level = level;
        FirstSetOfPopulationAndProduce();
    }
    
    public Empire(){
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
    public long getLevel(){
        return level;
    }
    
    public void setLevel(long level){
        this.level = level;
    }
    
    public List<Population> getPopulation(){
        return population;
    }
    
    public void setPopulation(List<Population> population){ 
        this.population = population;
    }
    
    public List<Stock> getProduce(){
        return produce;
    }
    
    public void setProduce(List<Stock> produce){   
        this.produce = produce;
    }
    
    public List<Stock> getWareHouse(){
        return warehouse;
    }
    
    public void setWareHouse(List<Stock> warehouse){   
        this.warehouse = warehouse;
    }   
    
    public List<Building> getBuildings(){
        return buildings;
    }
    
    public void setBuildings(List<Building> buildings){
        this.buildings = buildings;
    }
    
    

    public int getId() {
        return (int) id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    private void FirstSetOfPopulationAndProduce(){
        Random r = new Random();
        
        for (int i = 0; i < 3; i++) {
            produce.add(new Stock(NaturalAssetRepository.instance.getNaturals().get(i), r.nextInt(300)));
        }
    }
    
    public void addNewBuilding(Building b){
        buildings.add(b);
        for (int i = 0; i < produce.size(); i++) {
            var newQuantity = produce.get(i).getQuantity() - b.getProduce().get(i).getQuantity();
            produce.get(i).setQuantity(newQuantity);
        }
    }
}
