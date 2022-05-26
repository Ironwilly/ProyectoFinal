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
    public ResponseEntity<?> upload(@RequestPart("avatar") MultipartFile file1) throws IOException {


        String name = storageService.store(file1);
        String extension = StringUtils.getFilenameExtension(name);
        BufferedImage originalImage = ImageIO.read(file1.getInputStream());
        BufferedImage escaledImage = storageService.simpleResizer(originalImage, 128);
        OutputStream outputStream = Files.newOutputStream(storageService.load(name));
        ImageIO.write(escaledImage,extension,outputStream);



        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/avatar/")
                .path(name)
                .toUriString();

        FileResponse response = FileResponse.builder()
                .name(name)
                .size(file1.getSize())
                .type(file1.getContentType())
                .uri(uri)
                .build();

        return ResponseEntity.created(URI.create(uri)).body(response);

    }

    @GetMapping("/avatar/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) {
        MediaTypeUrlResource resource = (MediaTypeUrlResource) storageService.loadAsResource(filename);


        return ResponseEntity.status(HttpStatus.OK)
                .header("content-type", resource.getType())
                .body(resource);


    }

}
