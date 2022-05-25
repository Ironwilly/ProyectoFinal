package com.salesianos.triana.easycook.EasyCook.security.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginDto {

    private String nick;

    private String password;
}
