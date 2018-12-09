package pl.maciejdados.clinic.dto;


import lombok.Data;
import pl.maciejdados.clinic.entity.Account;
import pl.maciejdados.clinic.entity.PersonalDetails;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Data
public class SignupDto {

    @NotBlank
    @Email
    private String email;

    @NotBlank
    @Size(min = 3, max = 100)
    private String password;

    @NotBlank
    @Size(min = 2, max = 100)
    private String firstName;

    @NotBlank
    @Size(min = 2, max = 100)
    private String lastName;

    @NotBlank
    private String birthDate;

    @Size(min = 11, max = 11)
    private String nationalNumber;


    public Account createClinicUser() {
        final Account user = new Account();
        final PersonalDetails details = new PersonalDetails();


        details.setBirthDate(LocalDate.parse(getBirthDate(), DateTimeFormatter.ofPattern("dd.MM.yyyy")));
        details.setFirstName(getFirstName());
        details.setLastName(getLastName());
        details.setNationalNumber(getNationalNumber());
        details.setUser(user);

        user.setPassword(getPassword());
        user.setEmail(getEmail());
        user.setPersonalDetails(details);

        return user;
    }
}
