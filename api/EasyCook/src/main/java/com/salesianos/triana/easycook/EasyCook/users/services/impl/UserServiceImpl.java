package com.salesianos.triana.easycook.EasyCook.users.services.impl;

import com.salesianos.triana.easycook.EasyCook.errors.exceptions.SingleEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.services.StorageService;
import com.salesianos.triana.easycook.EasyCook.services.base.BaseService;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.dto.GetUserDto;
import com.salesianos.triana.easycook.EasyCook.users.dto.UserDtoConverter;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import com.salesianos.triana.easycook.EasyCook.users.model.UserRole;
import com.salesianos.triana.easycook.EasyCook.users.repositorios.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserServiceImpl extends BaseService <User, UUID, UserRepository> implements UserDetailsService {


    private final PasswordEncoder passwordEncoder;
    private final UserDtoConverter userDtoConverter;
    private final StorageService storageService;
    private final UserRepository userRepository;



   @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return (UserDetails) this.repositorio.findFirstByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException(email + " no encontrado."));
    }

    public User findUserByNick (String nick) {
       return  repositorio.findFirstByNick(nick).orElseThrow(() -> new UsernameNotFoundException(nick + " no encontrado"));

    }

    public List<User> loadUserByRole(UserRole rol) throws UsernameNotFoundException{
       return this.repositorio.findByRol(rol);
    }

    public Optional<User> loadUserById(UUID id) throws UsernameNotFoundException{
        return this.repositorio.findById(id);
    }

    public User saveUser(CreateUserDto createUserDto, MultipartFile file1,MultipartFile file2) throws IOException{

       if(createUserDto.getPassword().contentEquals(createUserDto.getRepetirPassword())){

           String name1 = storageService.store(file1);
           String name2 = storageService.store(file2);


           String extension1 = StringUtils.getFilenameExtension(name1);
           BufferedImage originalImage1 = ImageIO.read(file1.getInputStream());
           BufferedImage escaledImage1 = storageService.simpleResizer(originalImage1, 64);
           OutputStream outputStream1 = Files.newOutputStream(storageService.load(name1));
           ImageIO.write(escaledImage1, extension1, outputStream1);

           String extension2 = StringUtils.getFilenameExtension(name2);
           BufferedImage originalImage2 = ImageIO.read(file2.getInputStream());
           BufferedImage escaledImage2 = storageService.simpleResizer(originalImage2, 256);
           OutputStream outputStream2 = Files.newOutputStream(storageService.load(name2));
           ImageIO.write(escaledImage2, extension2, outputStream2);



           String uri1 = ServletUriComponentsBuilder.fromCurrentContextPath()
                   .path("/avatar/")
                   .path(name1)
                   .toUriString();

           String uri2 = ServletUriComponentsBuilder.fromCurrentContextPath()
                   .path("/avatar/")
                   .path(name2)
                   .toUriString();



           User user = User.builder()
                   .nombre(createUserDto.getNombre())
                   .apellidos(createUserDto.getApellidos())
                   .nick(createUserDto.getNick())
                   .ciudad(createUserDto.getCiudad())
                   .email(createUserDto.getEmail())
                   .password(passwordEncoder.encode(createUserDto.getPassword()))
                   .avatar(uri1)
                   .fondo(uri2)
                   .rol(UserRole.USUARIO)
                   .build();

           return save(user);



       }else {
           return null;
       }
    }

    public CreateUserDto editUser (CreateUserDto createUserDto, User user, MultipartFile file1,MultipartFile file2){

        Optional<User> oldUser = repositorio.findById(user.getId());
        storageService.deleteFile(oldUser.get().getAvatar());
        String filename1 = storageService.store(file1);

        Optional<User> oldUser2 = repositorio.findById(user.getId());
        storageService.deleteFile(oldUser.get().getAvatar());
        String filename2 = storageService.store(file2);


        String uri1 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/avatar/")
                .path(filename1)
                .toUriString();

        String uri2 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/fondo/")
                .path(filename2)
                .toUriString();


        return userRepository.findById(user.getId()).map(u -> {

            u.setNombre(createUserDto.getNombre());
            u.setApellidos(createUserDto.getApellidos());
            u.setNick(createUserDto.getNick());
            u.setCiudad(createUserDto.getCiudad());
            u.setEmail(createUserDto.getEmail());
            u.setAvatar(uri1);
            u.setFondo(uri2);
            userRepository.save(u);
            return userDtoConverter.convertUserToCreateUserDto(u);

        }).orElseThrow(() -> new SingleEntityNotFoundException(user.getId(),User.class));
    }

    public List<GetUserDto> listUserToListGetUserDto(List<User> users) {
        List<GetUserDto> getUserDtos = new ArrayList<>();
        users.stream().forEach(u -> {
            getUserDtos.add(userDtoConverter.convertUserToUserDto(u));
        });
        return getUserDtos;
    }



}
