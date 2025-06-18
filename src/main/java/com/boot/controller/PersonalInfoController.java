package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.boot.model.PersonalInfo;
import com.boot.dao.PersonalInfoRepository;
import java.util.List;

@RestController
@RequestMapping("/api/personal-info")
@CrossOrigin(origins = "http://localhost:4200")
public class PersonalInfoController {

    @Autowired
    private PersonalInfoRepository personalInfoRepository;

    @GetMapping
    public List<PersonalInfo> getAllPersonalInfo() {
        return personalInfoRepository.findAll();
    }

    @GetMapping("/current")
    public ResponseEntity<PersonalInfo> getCurrentPersonalInfo() {
        PersonalInfo personalInfo = personalInfoRepository.findFirstByOrderByIdAsc();
        if (personalInfo != null) {
            return ResponseEntity.ok(personalInfo);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<PersonalInfo> getPersonalInfoById(@PathVariable Long id) {
        return personalInfoRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public PersonalInfo createPersonalInfo(@RequestBody PersonalInfo personalInfo) {
        return personalInfoRepository.save(personalInfo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<PersonalInfo> updatePersonalInfo(@PathVariable Long id, @RequestBody PersonalInfo personalInfoDetails) {
        return personalInfoRepository.findById(id)
                .map(existingPersonalInfo -> {
                    existingPersonalInfo.setName(personalInfoDetails.getName());
                    existingPersonalInfo.setTitle(personalInfoDetails.getTitle());
                    existingPersonalInfo.setLocation(personalInfoDetails.getLocation());
                    existingPersonalInfo.setEmail(personalInfoDetails.getEmail());
                    existingPersonalInfo.setPhone(personalInfoDetails.getPhone());
                    existingPersonalInfo.setBio(personalInfoDetails.getBio());
                    existingPersonalInfo.setLinkedin(personalInfoDetails.getLinkedin());
                    existingPersonalInfo.setGithub(personalInfoDetails.getGithub());
                    existingPersonalInfo.setTwitter(personalInfoDetails.getTwitter());
                    existingPersonalInfo.setPortfolio(personalInfoDetails.getPortfolio());
                    existingPersonalInfo.setImageUrl(personalInfoDetails.getImageUrl());
                    return ResponseEntity.ok(personalInfoRepository.save(existingPersonalInfo));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePersonalInfo(@PathVariable Long id) {
        return personalInfoRepository.findById(id)
                .map(personalInfo -> {
                    personalInfoRepository.delete(personalInfo);
                    return ResponseEntity.ok().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }
} 