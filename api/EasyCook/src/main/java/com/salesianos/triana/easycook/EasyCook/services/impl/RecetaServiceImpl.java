package com.salesianos.triana.easycook.EasyCook.services.impl;

import com.salesianos.triana.easycook.EasyCook.dto.CreateRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.GetRecetaDto;
import com.salesianos.triana.easycook.EasyCook.dto.RecetaDtoConverter;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.ListNotFoundException;
import com.salesianos.triana.easycook.EasyCook.errors.exceptions.SingleEntityNotFoundException;
import com.salesianos.triana.easycook.EasyCook.models.Receta;
import com.salesianos.triana.easycook.EasyCook.models.RecetaCategoria;
import com.salesianos.triana.easycook.EasyCook.repositorios.RecetaRepository;
import com.salesianos.triana.easycook.EasyCook.services.RecetaService;
import com.salesianos.triana.easycook.EasyCook.services.StorageService;
import com.salesianos.triana.easycook.EasyCook.services.base.BaseService;
import com.salesianos.triana.easycook.EasyCook.users.dto.CreateUserDto;
import com.salesianos.triana.easycook.EasyCook.users.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.transaction.Transactional;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RecetaServiceImpl extends BaseService<Receta,Long,RecetaRepository> implements RecetaService {



    @Autowired
    private StorageService storageService;
    @Autowired
    private RecetaRepository recetaRepository;
    @Autowired
    private RecetaDtoConverter recetaDtoConverter;








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
    public Optional<GetRecetaDto> editReceta(Long id, CreateRecetaDto createRecetaDto, MultipartFile file3, User user) throws ListNotFoundException {

        Optional<Receta> data = recetaRepository.findById(id);

        if(data.isPresent()) {

            String name2 = StringUtils.cleanPath(String.valueOf(data.get().getFotoReceta())).replace("http://localhost:8080/recetas/", "")
                    .replace("%20", " ");

            Path pa = storageService.load(name2);

            String filename = StringUtils.cleanPath(String.valueOf(pa)).replace("http://localhost:8080/recetas/", "")
                    .replace("%20", " ");

            Path path = Paths.get(filename);

            storageService.deleteFile(path.toString());

            String original = storageService.store(file3);


            String uri3 = ServletUriComponentsBuilder.fromCurrentContextPath()
                    .path("/recetas/")
                    .path(original)
                    .toUriString();




            return data.map(newReceta ->{

                newReceta.setIngredientes(createRecetaDto.getIngredientes());
                newReceta.setPreparacion(createRecetaDto.getPreparacion());
                newReceta.setTiempoCocinar(createRecetaDto.getTiempoCocinar());
                newReceta.setRecetaCategoria(RecetaCategoria.valueOf(createRecetaDto.getRecetaCategoria()));
                newReceta.setFotoReceta(uri3);
                recetaRepository.save(newReceta);
                return  recetaDtoConverter.getRecetaToRecetaDto(newReceta,user);




        });
        }else {
            throw new ListNotFoundException("No existe la receta que quieres editar");
        }




    }

    @Transactional
    @Override
    public void removeRecetaById(Long id) throws SingleEntityNotFoundException {

        Optional<Receta> data = recetaRepository.findById(id);

        if(data.isEmpty()){
            throw new SingleEntityNotFoundException(id,Receta.class);
        }else {
            String name = StringUtils.cleanPath(String.valueOf(data.get().getFotoReceta())).replace("http://localhost:8080/recetas/","").replace("%20", " ");

            Path pa = storageService.load(name);
            String filename = StringUtils.cleanPath(String.valueOf(pa)).replace("http://localhost:8080/recetas/", "").replace("%20", " ");

            Path path = Paths.get(filename);

            storageService.deleteFile(path.toString());
            //recetaRepository.deleteById(id);
            recetaRepository.deleteRecetaById(id);
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
