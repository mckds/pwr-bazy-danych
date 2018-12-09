package pl.maciejdados.clinic.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller("/")
public class HomeController {

    @GetMapping({"/", "home", "index"})
    public String home(Principal principal) {
        if(principal != null) {
            return "home/homeSignedIn";
        } else {
            return "home/homeNotSignedIn";
        }
    }

}
