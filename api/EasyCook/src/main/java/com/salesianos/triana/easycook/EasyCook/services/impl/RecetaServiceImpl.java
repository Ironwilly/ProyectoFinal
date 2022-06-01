package com.salesianos.triana.easycook.EasyCook.services.impl;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.GetRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.RecetaDtoConverter;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.SingleEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import com.salesianos.triana.easycook.EasyCook.repositorios.RecetaRepository;
import com.salesianos.triana.easycook.EasyCook.services.RecetaService;
import com.salesianos.triana.easycook.EasyCook.services.StorageService;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import java.util.stream.Collectors;

@Service
public class RecetaServiceImpl implements RecetaService {


    @Autowired
    private  StorageService storageService;
    @Autowired
    private  RecetaRepository recetaRepository;
    @Autowired
    private RecetaDtoConverter recetaDtoConverter;




    @Override
    public List<GetRecetaDto> findAll() {
        List<Receta> recetaList = recetaRepository.findAll();

        if (recetaList.isEmpty()){
            throw new ListEntityNotFoundException(Receta.class);

        }else {
            List<GetRecetaDto> result = recetaList.stream()
                    .map(recetaDtoConverter::getRecetaToRecetaDto)
                    .collect(Collectors.toList());
            return result;
        }
    }

    @Override
    public GetRecetaDto findOne(Long id, User user) {
        Optional<Receta> receta = recetaRepository.findById(id);

        if(receta.isEmpty()){
            throw new SingleEntityNotFoundException(id,Receta.class);

        }else {
            return recetaDtoConverter.getRecetaToRecetaDto(receta.get());

        }

    }

    @Override
    public CreateRecetaDto saveReceta(CreateRecetaDto createRecetaDto, MultipartFile file3, User user) {



        String filenameScale = storageService.storeScale(file3);

        String uriScale = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/recetas/")
                .path(filenameScale)
                .toUriString();

        Receta receta = recetaRepository.save(Receta.builder()

                .ingredientes(createRecetaDto.getIngredientes())
                .preparacion(createRecetaDto.getPreparacion())
                .tiempoCocinar(createRecetaDto.getTiempoCocinar())
                .recetaCategoria(RecetaCategoria.valueOf(createRecetaDto.getRecetaCategoria()))
                .fotoReceta(uriScale)
                .user(user)
                .build());
        return recetaDtoConverter.convertRecetaToCreateRecetaDto(Receta.builder()

                .ingredientes(receta.getIngredientes())
                .preparacion(receta.getPreparacion())
                .tiempoCocinar(receta.getTiempoCocinar())
                .recetaCategoria(receta.getRecetaCategoria())
                .fotoReceta(uriScale)
                .user(user)
                .build()




        );
    }

    @Override
    public Receta editReceta(Long id, CreateRecetaDto createRecetaDto, MultipartFile file3, CreateUserDto createUserDto) {

        Optional<Receta> receta = recetaRepository.findById(id);
        String filename = storageService.store(file3);

        String uri3 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/recetas/")
                .path(filename)
                .toUriString();

        if(receta.isPresent()){
            Receta recetaEncontrada = receta.get();
            recetaEncontrada.setId(receta.get().getId());
            recetaEncontrada.setIngredientes(receta.get().getIngredientes());
            recetaEncontrada.setPreparacion(receta.get().getPreparacion());
            recetaEncontrada.setTiempoCocinar(receta.get().getTiempoCocinar());
            recetaEncontrada.setRecetaCategoria(receta.get().getRecetaCategoria());

            recetaEncontrada.setFotoReceta(uri3);

            return recetaRepository.save(recetaEncontrada);




        }else {
            throw new SingleEntityNotFoundException(id,Receta.class);
        }
    }

    @Override
    public void removeRecetaById(Long id, User user) throws IOException {

        Optional<Receta> data = recetaRepository.findById(id);

        if(data.isEmpty()){
            throw new SingleEntityNotFoundException(id,Receta.class);
        }else {
            String name = StringUtils.cleanPath(String.valueOf(data.get().getFotoReceta())).replace("http://localhost:8080/recetas/","").replace("%20", " ");

            Path pa = storageService.load(name);
            String filename = StringUtils.cleanPath(String.valueOf(pa)).replace("http://localhost:8080/recetas/", "").replace("%20", " ");

            Path path = Paths.get(filename);

            storageService.deleteFile(path.toString());
            recetaRepository.deleteById(id);
          }
    }



    @Override
    public List<Receta> findRecetaByCategoriaOtros(RecetaCategoria recetaCategoria) {
        return recetaRepository.findRecetaByCategoriaOtros(recetaCategoria);
    }

    @Override
    public List<Receta> findRecetaByCategoriaDulces(RecetaCategoria recetaCategoria) {
        return recetaRepository.findRecetaByCategoriaDulces(recetaCategoria);
    }

    @Override
    public List<Receta> findRecetaByCategoriaPastas(RecetaCategoria recetaCategoria) {
        return recetaRepository.findRecetaByCategoriaPastas(recetaCategoria);
    }
}
