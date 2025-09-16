package vn.iotstar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(scanBasePackages = {"vn.iotstar.Controller"})
@ComponentScan
public class Springboot23110203PhamTranThienDangCrudApplication {

	public static void main(String[] args) {
		SpringApplication.run(Springboot23110203PhamTranThienDangCrudApplication.class, args);
	}

}
