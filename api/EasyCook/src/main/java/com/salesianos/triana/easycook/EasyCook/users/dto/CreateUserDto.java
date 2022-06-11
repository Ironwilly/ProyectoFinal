package com.salesianos.triana.easycook.EasyCook.users.dto;

import com.salesianos.triana.easycook.EasyCook.validacion.anotaciones.UserUniqueNick;
import lombok.*;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CreateUserDto {



    private String nombre;

    private String apellidos;

    @UserUniqueNick(message = "El nombre de usuario ya está en uso")
    private String nick;

    private String ciudad;

    private String email;

    private String password;

    private String repetirPassword;

    private String avatar;




}
