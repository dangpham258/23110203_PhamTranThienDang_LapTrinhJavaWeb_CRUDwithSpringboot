/*
 * package vn.iotstar.security;
 * 
 * import java.io.IOException; import jakarta.servlet.*; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * public class AuthFilter implements Filter {
 * 
 * @Override public void doFilter(ServletRequest req, ServletResponse res,
 * FilterChain chain) throws IOException, ServletException {
 * 
 * HttpServletRequest request = (HttpServletRequest) req; HttpServletResponse
 * response = (HttpServletResponse) res;
 * 
 * String uri = request.getRequestURI();
 * 
 * // demo: chặn /admin/* nếu chưa đăng nhập (bạn tự gắn session khi login)
 * Object user = request.getSession().getAttribute("USER_SESSION"); if
 * (uri.startsWith("/admin/") && user == null) {
 * response.sendRedirect("/web/login"); // hoặc controller return; }
 * 
 * chain.doFilter(req, res); } }
 */