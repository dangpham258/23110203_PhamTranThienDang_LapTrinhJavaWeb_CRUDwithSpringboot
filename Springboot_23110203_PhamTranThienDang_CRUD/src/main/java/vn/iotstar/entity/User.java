package vn.iotstar.entity;

import java.io.Serializable;
import jakarta.persistence.*;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity 
@Table(name="Users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="UserId")
    private Long userId;

    @Column(name="Username", length=100, nullable=false, unique=true)
    private String username;

    @Column(name="PasswordHash", length=200, nullable=false)
    private String passwordHash;

    @Column(name="Fullname", columnDefinition="nvarchar(255)")
    private String fullname;

    @Column(name="RoleName", length=50) // ADMIN / STAFF / VIEWER
    private String roleName;

    @Column(name="Active")
    private boolean active = true;
}

