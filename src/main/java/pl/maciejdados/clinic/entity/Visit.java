package pl.maciejdados.clinic.entity;


import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class Visit {
    @Id
    @GeneratedValue
    private Long id;

    private LocalDate startDate;
    private LocalDate endDate;

    private String reason;

    @ManyToOne
    @JoinColumn(name = "PATIENT_ID")
    private Patient patient;
}
