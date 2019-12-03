package Repositories;

import Exceptions.LoginException;
import Exceptions.RegistrationException;
import Models.User;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author javaee
 */
//@RequestScoped
public class UserRepository {
    private EntityManager em = Persistence.createEntityManagerFactory("hoePu").createEntityManager();
    
    public static final UserRepository instance = new UserRepository();
    
    private List<User> users = new ArrayList<>();

    public UserRepository() {
        //users.add(new User(0, "a", "a", false));
        //addUser(new User("aa", "aa",false));
    }
   
    public void addUser(User pValue){
        em.getTransaction().begin();
        em.persist(pValue);
        em.getTransaction().commit();
    }
//    public User addUser(User pValue){
//        //em.getTransaction().begin();
//        em.persist(pValue);
//        return pValue;
//        //em.getTransaction().commit();
//    }
    
    public List<User> getUsers(){
        return em.createQuery("SELECT u FROM User u", User.class).getResultList();
    }
    
    public void registration(String pName, String pPassword) throws RegistrationException{
        for(User u: getUsers()){
            if(u.getName().equals(pName))
                throw new RegistrationException();
        }
        //User tmpUser = new User(getUsers().size(), pName, pPassword, false);      
        User tmpUser = new User(pName, pPassword, false);   
        //users.add(tmpUser);
        addUser(tmpUser);
    }

    public User login(String pName, String pPassword) throws LoginException{
        for(User u: getUsers()){
            if(u.getName().equals(pName) && u.getPassword().equals(pPassword))
                return u;
        }
        throw new LoginException();
    }

    
}
