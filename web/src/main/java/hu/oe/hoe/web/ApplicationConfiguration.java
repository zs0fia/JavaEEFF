package hu.oe.hoe.web;

import hu.oe.hoe.adatok.Species;
import hu.oe.hoe.adatok.SpeciesRepository;
import hu.oe.hoe.adatok.UserRepository;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;

@ApplicationScoped
public class ApplicationConfiguration {
    
    @Produces
    public UserRepository createUserRepository(){
        
        UserRepository userRep = new UserRepository();
        
        try{
            userRep.registration("a", "a");
        } catch(Exception e){
            e.printStackTrace();
        }
        
        return userRep;
    }
    
    @Produces
    public SpeciesRepository createSpeciesRepository(){
        
        SpeciesRepository speciesRep = new SpeciesRepository();
        
        try{
            speciesRep.add(new Species("Ember", "okos"));
        } catch(Exception e){
            e.printStackTrace();
        }
        
        return speciesRep;
    }
}
