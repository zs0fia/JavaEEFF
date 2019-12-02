package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "building")
@NamedQueries({
    @NamedQuery(name = "building.findById", query = "SELECT b FROM Building b WHERE b.id = :id"),
    @NamedQuery(name = "building.sortByNameAsc", query = "SELECT b FROM Building b ORDER BY b.name ASC"),
    @NamedQuery(name = "building.sortByNameDesc", query = "SELECT b FROM Building b ORDER BY b.name DESC")
})
public class Building {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    private String name;
    private String description;
    @OneToMany
    private List<Stock> produce = new ArrayList<>();
    private long buildTime;
    
    public Building(String name, String description, List<Stock> produce, long buildTime){
        this.name = name;
        this.description = description;
        this.produce = produce;
        this.buildTime = buildTime;
    }
    
    public Building(){
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
    
    public List<Stock> getProduce(){
        return produce;
    }
    
    public void setProduce(List<Stock> produce){
        this.produce = produce;
    }
    
    public long getBuildTime(){
        return buildTime;
    }
    
    public void setBuildTime(long buildTime){
        this.buildTime = buildTime;
    }
}
