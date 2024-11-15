package com.example.demo.controller;


import com.example.demo.model.Song;
import com.example.demo.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/songs")
public class SongController {

    @Autowired
    private SongService songService;

    @GetMapping
    public List<Song> getSongs() {
        return songService.getAllSongs();
    }

    @PostMapping
    public Song addSong(@RequestBody Song song) {
        return songService.addSong(song);
    }

    @DeleteMapping("/{id}")
    public void deleteSong(@PathVariable Long id) {
        songService.deleteSong(id);
    }

    @DeleteMapping("/all")
    public ResponseEntity<Void> deleteAllSongs() {
        songService.deleteAllSongs(); // Método para eliminar todas las canciones
        return ResponseEntity.noContent().build();
    }
}
