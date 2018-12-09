package pl.maciejdados.clinic.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.maciejdados.clinic.dto.SignupDto;
import pl.maciejdados.clinic.entity.Account;
import pl.maciejdados.clinic.service.ClinicUserService;

import javax.validation.Valid;

@Controller("/templates/signup")
public class SignupController {

    public static final String SIGNUP_VIEW_NAME = "signup/signup";


    @Autowired
    private ClinicUserService userService;

    @GetMapping
    public String getSignup(Model model) {
        model.addAttribute("signupDto", new SignupDto());
        return SIGNUP_VIEW_NAME;
    }

    @PostMapping
    public String postSignup(@Valid @ModelAttribute SignupDto signupDto, Errors errors, RedirectAttributes ra) {
        if (errors.hasErrors()) {
            return SIGNUP_VIEW_NAME;
        }

        Account account = userService.save(signupDto.createClinicUser());
        return "redirect:/";
    }


}
