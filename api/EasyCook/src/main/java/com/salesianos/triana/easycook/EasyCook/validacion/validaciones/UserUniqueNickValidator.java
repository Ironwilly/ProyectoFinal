package com.salesianos.triana.easycook.EasyCook.validacion.validaciones;

import com.salesianos.triana.easycook.EasyCook.users.repositorios.UserRepository;
import com.salesianos.triana.easycook.EasyCook.validacion.anotaciones.UserUniqueNick;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UserUniqueNickValidator implements ConstraintValidator<UserUniqueNick,String> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void initialize(UserUniqueNick constraintAnnotation){}
    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return StringUtils.hasText(s) && userRepository.existsByNick(s);
    }
}
