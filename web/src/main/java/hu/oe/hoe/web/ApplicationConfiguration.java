package hu.oe.hoe.web;

import Models.Building;
import Models.NaturalAsset;
import Models.Species;
import Models.Stock;
import Models.User;
import Repositories.BuildingRepository;
import Repositories.EmpireRepository;
import Repositories.HeroRepository;
import Repositories.NaturalAssetRepository;
import Repositories.SpeciesRepository;
import Repositories.UserRepository;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;

@ApplicationScoped
public class ApplicationConfiguration {
    
        @Produces
        public HeroRepository createHeroRepository(){
            HeroRepository hr = new HeroRepository();
            return hr;
        }
    
        @Produces
        public UserRepository createUserRepository(){
            UserRepository ur = new UserRepository();
            try{
            ur.addUser(new User("javaee", "javaee", false));
            }
            catch(Exception e){e.printStackTrace();}
            return ur;
        }
    
        @Produces
        public SpeciesRepository createSpeciesRepository(){
            SpeciesRepository sr = new SpeciesRepository();
            try{
                sr.add(new Species("Ember", "okos"));
                sr.add(new Species("Torpe", "kicsi"));
                sr.add(new Species("Tunde", "szép"));
            }
            catch(Exception e){e.printStackTrace();}
            return sr;
        }
        
        @Produces
        public BuildingRepository createBuildingRepository(){
            BuildingRepository br = new BuildingRepository();
            try{
                br.addBuilding(new Building("Akademia", "oktatasra szolgal", 10));
                br.addBuilding(new Building("Barakk", "katonak kepzese", 10));
            }
            catch(Exception e){e.printStackTrace();}
            return br;
        }
        
        @Produces
        public EmpireRepository createEmpireRepository(){
            EmpireRepository er = new EmpireRepository();
            return er;
        }
        
        @Produces
        @ApplicationScoped
        public NaturalAssetRepository createNaturalAssetRepository(){
            NaturalAssetRepository nar = new NaturalAssetRepository();
            try{
                nar.addNatural(new NaturalAsset("fa", "fak kivagasaval nyerheto"));
                nar.addNatural(new NaturalAsset("ko", "banyasszattal nyerheto"));
                nar.addNatural(new NaturalAsset("arany", "banyaszattal nyerheto"));
            }
            catch(Exception e){e.printStackTrace();}
            return nar;
        }
        
//        @Produces
//        public StockRepository createStockRepository(){
//            StockRepository sr = new StockRepository();
//            return sr;
//        }
        
    
//    @Produces
//    public UserRepository createUserRepository(){
//        
//        UserRepository userRep = new UserRepository();
//        
//        try{
//            userRep.registration("a", "a");
//        } catch(Exception e){
//            e.printStackTrace();
//        }
//        
//        return userRep;
//    }
//    
//    @Produces
//    public SpeciesRepository createSpeciesRepository(){
//        
//        SpeciesRepository speciesRep = new SpeciesRepository();
//        
//        try{
//            speciesRep.add(new Species("Ember", "okos"));
//        } catch(Exception e){
//            e.printStackTrace();
//        }
//        
//        return speciesRep;
//    }
}
