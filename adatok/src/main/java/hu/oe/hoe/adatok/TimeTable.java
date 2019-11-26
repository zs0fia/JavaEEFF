package hu.oe.hoe.adatok;

import java.security.Timestamp;

public class TimeTable {
    private Hero hero;
    private Empire empire;
    private Timestamp start;
    private Timestamp stop;

    public Hero getHero() {
        return hero;
    }

    public void setHero(Hero hero) {
        this.hero = hero;
    }
    
    public Empire getEmpire(){
        return empire;
    }
    
    public void setEmpire(Empire empire){
        this.empire = empire;
    }

    public Timestamp getStart() {
        return start;
    }

    public void setStart(Timestamp start) {
        this.start = start;
    }

    public Timestamp getStop() {
        return stop;
    }

    public void setStop(Timestamp stop) {
        this.stop = stop;
    }
}
