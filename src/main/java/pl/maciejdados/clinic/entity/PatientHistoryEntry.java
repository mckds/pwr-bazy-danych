package pl.maciejdados.clinic.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class PatientHistoryEntry {
    @Id
    @GeneratedValue
    private Long id;

    private LocalDate entryDate;

    private String content;

    @ManyToOne
    @JoinColumn(name = "PATIENT_ID")
    private Patient patient;
}
