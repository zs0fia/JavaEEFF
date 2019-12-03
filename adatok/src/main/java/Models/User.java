package Models;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    private String name, password;
    private boolean admin;
    @OneToMany
    ///@OneToMany(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    private List<Hero> heroes = new ArrayList<>();
    @OneToMany
    //@OneToMany(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    private List<Empire> empires = new ArrayList<>();
    

    public User(int id, String name, String password, boolean admin) {
        this.name = name;
        this.password = password;
        this.admin = admin;
    }
    
    public User(String name, String pw, boolean admin){
        this.name = name;
        password = pw;
        this.admin = admin;
    }

    public User() {
    }

    public List<Hero> getHeroes() {
        return heroes;
    }

    public void setHeroes(List<Hero> heroes) {
        this.heroes = heroes;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public List<Empire> getEmpires() {
        return empires;
    }

    public void setEmpires(List<Empire> empires) {
        this.empires = empires;
    }

    public int getId() {
        return (int) id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    public Empire GetEmpireById(int id){     
        return GetObjectFromCollectionById(empires, id);
    }
    
    public Hero GetHeroById(int id){   
        return GetObjectFromCollectionById(heroes, id);
    }
    
    public void RemoveEmpireById(int id){
        Empire empireToRemove = GetObjectFromCollectionById(empires, id);
        
        if(empireToRemove != null){
            empires.remove(empireToRemove);
        }
    }
    
    public void RemoveHeroById(int id){
        Hero heroToRemove = GetObjectFromCollectionById(heroes, id);
        
        if(heroToRemove != null){
            heroes.remove(heroToRemove);
        }
    }
    
    public void AddEmpire(Empire e){
        empires.add(e);
    }
    public void AddHero(Hero h){
        heroes.add(h);
    }
    
    private <T extends UniqueId> T GetObjectFromCollectionById(List<T> collection, int id){
        int i = 0;
        
        while(i <  collection.size() && collection.get(i).getId() != id){
            i++;
        }
        
        if(i < collection.size()){
            return collection.get(i);
        }
        
        return null;
    } 
}
