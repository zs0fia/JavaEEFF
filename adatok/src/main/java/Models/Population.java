/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Models.People;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="population")
public class Population {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    //@OneToOne
    @ManyToOne
    private People people;
    private long quantity;
    
    public Population(People people, long quantity){
        this.quantity = quantity;
        this.people = people;
    }
    
    public Population(){
    }
    
    public People getPeople(){
        return people;
    }
    
    public void setPeople(People people){
        this.people = people;
    }
    
    public long getQuantity(){
        return quantity;
    }
    
    public void setQuantity(long quantity){
        this.quantity = quantity;
    }
}
