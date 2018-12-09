package pl.maciejdados.clinic.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Entity
public class Doctor {
    @Id
    @GeneratedValue
    private Long id;

    private long npwz;


    @OneToOne
    @JoinColumn(name = "ACCOUNT_ID")
    private Account account;

    @ManyToMany
    @JoinTable(name = "DOCTOR_SPECIALITY",
            joinColumns = @JoinColumn(name = "DOCTOR_ID", referencedColumnName = "ID"),
            inverseJoinColumns = @JoinColumn(name = "SPECIALITY_ID", referencedColumnName = "ID"))
    private Set<Speciality> specialities = new HashSet<>();


    @OneToMany(mappedBy = "doctor")
    private List<Schedule> schedules = new ArrayList<>();
}
