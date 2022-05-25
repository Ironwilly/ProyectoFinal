package com.salesianos.triana.easycook.EasyCook.users.dto;

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

    private String nick;

    private String ciudad;

    private String email;

    private String password;

    private String repetirPassword;

    private String avatar;

    private String fondo;

}
