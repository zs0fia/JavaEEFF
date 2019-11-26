package hu.oe.hoe.adatok;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "hero")
public class Hero implements UniqueId {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    
    private String name, description;
    @OneToMany
    private List<Hybrid> hybrid = new ArrayList<>();


    public Hero(String name, String description) {
        this.name = name;
        this.description = description;

    }

    public Hero() {
    }
    
    public int getId() {
        return (int) id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Hybrid> getHybrid() {
        return hybrid;
    }

    public void setHybrid(List<Hybrid> hybrid) {
        this.hybrid = hybrid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
