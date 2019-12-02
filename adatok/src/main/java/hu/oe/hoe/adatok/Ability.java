package hu.oe.hoe.adatok;

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
    private byte force_;
    private byte brain;
    private byte skill;

    public byte getForce() {
        return force_;
    }
    
    public void setForce(byte force) {
        this.force_ = force;
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
