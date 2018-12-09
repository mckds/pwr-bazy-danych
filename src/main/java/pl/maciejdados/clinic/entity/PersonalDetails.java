package pl.maciejdados.clinic.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class PersonalDetails {

    @Id
    @GeneratedValue
    private Long personalDetailsId;

    private String firstName;
    private String lastName;
    private LocalDate birthDate;
    private String nationalNumber;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clinic_user_id")
    private Account user;
}
