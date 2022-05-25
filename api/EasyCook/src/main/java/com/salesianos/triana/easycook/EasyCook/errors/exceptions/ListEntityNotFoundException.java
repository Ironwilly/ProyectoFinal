package com.salesianos.triana.easycook.EasyCook.errors.exceptions;

public class ListEntityNotFoundException extends EntityNotFoundException{

    public ListEntityNotFoundException(Class clazz){
        super(String.format("No se pueden encontrar del tipo %s  ",clazz.getName()));


    }
}
