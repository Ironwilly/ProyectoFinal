package com.salesianos.triana.easycook.EasyCook.security.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class LoginDto {

    private String email;

    private String password;
}
