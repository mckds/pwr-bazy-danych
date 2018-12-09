package pl.maciejdados.clinic.entity;


import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class Schedule {
    @Id
    @GeneratedValue
    private Long id;

    private LocalDate startDate;
    private LocalDate endDate;

    private Long roomNumber;

    @ManyToOne
    @JoinColumn(name = "DOCTOR_ID")
    private Doctor doctor;
}
