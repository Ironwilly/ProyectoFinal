package com.salesianos.triana.easycook.EasyCook.controller;

import com.salesianos.triana.easycook.EasyCook.dto.FileResponse;
import com.salesianos.triana.easycook.EasyCook.services.StorageService;
import com.salesianos.triana.easycook.EasyCook.utils.MediaTypeUrlResource;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.nio.file.Files;

@RestController
@RequiredArgsConstructor
public class FileController {

    private final StorageService storageService;

    @PostMapping("/upload")
    public ResponseEntity<?> upload(@RequestPart("avatar") MultipartFile file1,@RequestPart("fondo") MultipartFile file2,@RequestPart("receta")MultipartFile file3) throws IOException {


        String name1 = storageService.store(file1);
        String extension = StringUtils.getFilenameExtension(name1);
        BufferedImage originalImage = ImageIO.read(file1.getInputStream());
        BufferedImage escaledImage = storageService.simpleResizer(originalImage, 64);
        OutputStream outputStream = Files.newOutputStream(storageService.load(name1));
        ImageIO.write(escaledImage,extension,outputStream);

        String name2 = storageService.store(file2);
        String extension2 = StringUtils.getFilenameExtension(name2);
        BufferedImage originalImage2 = ImageIO.read(file1.getInputStream());
        BufferedImage escaledImage2 = storageService.simpleResizer(originalImage2, 128);
        OutputStream outputStream2 = Files.newOutputStream(storageService.load(name2));
        ImageIO.write(escaledImage2,extension2,outputStream2);

        String name3 = storageService.store(file3);
        String extension3 = StringUtils.getFilenameExtension(name3);
        BufferedImage originalImage3 = ImageIO.read(file1.getInputStream());
        BufferedImage escaledImage3 = storageService.simpleResizer(originalImage3, 128);
        OutputStream outputStream3 = Files.newOutputStream(storageService.load(name3));
        ImageIO.write(escaledImage3,extension3,outputStream3);



        String uri1 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/avatar/")
                .path(name1)
                .toUriString();

        String uri2 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/fondo/")
                .path(name2)
                .toUriString();
        String uri3 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/recetas/")
                .path(name3)
                .toUriString();

        FileResponse response = FileResponse.builder()
                .name(name1)
                .name(name2)
                .size(file1.getSize())
                .size(file2.getSize())
                .size(file3.getSize())
                .type(file1.getContentType())
                .type(file2.getContentType())
                .type(file3.getContentType())
                .uri(uri1)
                .uri(uri2)
                .uri(uri3)
                .build();

        return ResponseEntity.status(HttpStatus.CREATED).body(response);

    }

    @GetMapping("/avatar/{filename:.+}")
    public ResponseEntity<Resource> getFile1(@PathVariable String filename1) {
        MediaTypeUrlResource resource = (MediaTypeUrlResource) storageService.loadAsResource(filename1);


        return ResponseEntity.status(HttpStatus.OK)
                .header("content-type", resource.getType())
                .body(resource);


    }

    @GetMapping("/fondo/{filename:.+}")
    public ResponseEntity<Resource> getFile2(@PathVariable String filename2) {
        MediaTypeUrlResource resource = (MediaTypeUrlResource) storageService.loadAsResource(filename2);


        return ResponseEntity.status(HttpStatus.OK)
                .header("content-type", resource.getType())
                .body(resource);


    }

    @GetMapping("/receta/{filename:.+}")
    public ResponseEntity<Resource> getFile3(@PathVariable String filename3) {
        MediaTypeUrlResource resource = (MediaTypeUrlResource) storageService.loadAsResource(filename3);


        return ResponseEntity.status(HttpStatus.OK)
                .header("content-type", resource.getType())
                .body(resource);


    }



}
