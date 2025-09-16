/*
 * package vn.iotstar.configs;
 * 
 * import org.springframework.boot.web.servlet.FilterRegistrationBean; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration;
 * 
 * import vn.iotstar.security.AuthFilter;
 * 
 * @Configuration public class FilterConfig {
 * 
 * @Bean public FilterRegistrationBean<AuthFilter> authFilterRegistration() {
 * FilterRegistrationBean<AuthFilter> registration = new
 * FilterRegistrationBean<>(); registration.setFilter(new AuthFilter());
 * registration.addUrlPatterns("/*"); registration.setName("authFilter");
 * registration.setOrder(10); return registration; } }
 */