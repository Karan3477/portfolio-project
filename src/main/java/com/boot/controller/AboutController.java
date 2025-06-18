package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.boot.model.About;
import com.boot.dao.AboutRepository;
import java.util.List;

@RestController
@RequestMapping("/api/about")
@CrossOrigin(origins = "http://localhost:4200")
public class AboutController {

    @Autowired
    private AboutRepository aboutRepository;

    @GetMapping
    public List<About> getAllAbout() {
        return aboutRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<About> getAboutById(@PathVariable Long id) {
        return aboutRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public About createAbout(@RequestBody About about) {
        return aboutRepository.save(about);
    }

    @PutMapping("/{id}")
    public ResponseEntity<About> updateAbout(@PathVariable Long id, @RequestBody About aboutDetails) {
        return aboutRepository.findById(id)
                .map(existingAbout -> {
                    existingAbout.setTitle(aboutDetails.getTitle());
                    existingAbout.setBio(aboutDetails.getBio());
                    existingAbout.setImageUrl(aboutDetails.getImageUrl());
                    return ResponseEntity.ok(aboutRepository.save(existingAbout));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteAbout(@PathVariable Long id) {
        return aboutRepository.findById(id)
                .map(about -> {
                    aboutRepository.delete(about);
                    return ResponseEntity.ok().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }
} 