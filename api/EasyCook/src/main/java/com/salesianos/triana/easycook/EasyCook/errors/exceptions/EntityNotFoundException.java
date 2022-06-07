package com.salesianos.triana.easycook.EasyCook.errors.exceptions;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class EntityNotFoundException extends RuntimeException{

    public EntityNotFoundException(Long id,Class c) {
        super(String.format("No se encontro el punto de interes con el siguiente id: %s",c.getName(), id));
    }


    public EntityNotFoundException(String format) {

    }
}
