package com.wani.springjenkinscodedeploytutorial.ui;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthCheckController {

    @GetMapping("/health")
    public String health() {
        return "on";
    }
}
