package com.salesianos.triana.easycook.EasyCook.users.repositorios;

import com.salesianos.triana.easycook.EasyCook.services.StorageService;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import com.salesianos.triana.easycook.EasyCook.users.model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.UUID;


public interface UserRepository extends JpaRepository <User, UUID> {



    Optional<User> findFirstByEmail(String email);

    Optional<User> findFirstByNick (String nick);

    List<User> findByRol (UserRole rol);

    Optional<User> findById(UUID id);


}
