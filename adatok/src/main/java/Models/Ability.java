package Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ability")
public class Ability {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private long id;
    private byte force;
    private byte brain;
    private byte skill;
    
    public Ability(){}
    
    public Ability(byte force, byte brain, byte skill){
        this.force = force;
        this.brain = brain;
        this.skill = skill;
    }

    public byte getForce() {
        return force;
    }
    
    public void setForce(byte force) {
        this.force = force;
    }

    public byte getBrain() {
        return brain;
    }
    
    public void setBrain(byte brain) {
        this.brain = brain;
    }

    public byte getSkill() {
        return skill;
    }
    
    public void setSkill(byte skill) {
        this.skill = skill;
    }
}
