package pl.maciejdados.clinic.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import java.util.Set;

@Data
@Entity
public class Speciality {
    @Id
    @GeneratedValue
    private Long id;

    private String speciality;

    @ManyToMany(mappedBy = "specialities")
    private Set<Doctor> doctors;
}
