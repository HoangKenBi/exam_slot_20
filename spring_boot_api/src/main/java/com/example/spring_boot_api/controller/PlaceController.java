package com.example.spring_boot_api.controller;

import com.example.spring_boot_api.entity.Place;
import com.example.spring_boot_api.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/places")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @GetMapping("/getAll")
    public List<Place> getAllPlaces() {
        return placeService.getAllPlaces();
    }
}
