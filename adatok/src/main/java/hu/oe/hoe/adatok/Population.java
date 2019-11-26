/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.oe.hoe.adatok;

/**
 *
 * @author javaee
 */
public class Population {
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
