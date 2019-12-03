package Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "naturals")
//@NamedQueries({
//    @NamedQuery(name = "naturalAsset.findById", query = "SELECT n FROM NaturalAsset n WHERE n.id = :id"),
//    @NamedQuery(name = "naturalAsset.sortByNameAsc", query = "SELECT n FROM NaturalAsset n ORDER BY n.name ASC"),
//    @NamedQuery(name = "naturalAsset.sortByNameDesc", query = "SELECT n FROM NaturalAsset n ORDER BY n.name DESC")
//})
public class NaturalAsset {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    private String name;
    private String description;
    
    public NaturalAsset(String name, String description){
        this.name = name;
        this.description = description;
    }
    
    public NaturalAsset(){
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
