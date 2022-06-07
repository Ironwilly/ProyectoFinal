package com.salesianos.triana.easycook.EasyCook.validacion.anotaciones;

import com.salesianos.triana.easycook.EasyCook.validacion.validaciones.UserUniqueNickValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UserUniqueNickValidator.class)
@Documented
public @interface UserUniqueNick {

    String message() default "El nommbre de usuario ya está en uso";

    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

}
