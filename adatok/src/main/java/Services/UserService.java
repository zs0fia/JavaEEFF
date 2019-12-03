/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Exceptions.LoginException;
import Exceptions.RegistrationException;
import Models.User;
import Repositories.UserRepository;
import javax.ejb.Stateless;
import javax.inject.Inject;

/**
 *
 * @author javaee
 */
@Stateless
public class UserService {
    @Inject
    private UserRepository userRepo = new UserRepository();

    public void registration(String pName, String pPassword) throws RegistrationException{
        for(User u: userRepo.getUsers()){
            if(u.getName().equals(pName))
                throw new RegistrationException();
        }
        //User tmpUser = new User(getUsers().size(), pName, pPassword, false);      
        User tmpUser = new User(pName, pPassword, false);   
        //users.add(tmpUser);
        userRepo.addUser(tmpUser);
    }

    public User login(String pName, String pPassword) throws LoginException{
        for(User u: userRepo.getUsers()){
            if(u.getName().equals(pName) && u.getPassword().equals(pPassword))
                return u;
        }
        throw new LoginException();
    }
}
