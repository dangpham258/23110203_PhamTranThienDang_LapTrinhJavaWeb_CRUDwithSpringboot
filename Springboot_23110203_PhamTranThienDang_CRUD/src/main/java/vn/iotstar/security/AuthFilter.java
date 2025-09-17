package vn.iotstar.security;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String uri = request.getRequestURI();
		Object user = request.getSession(false) == null ? null : request.getSession(false).getAttribute("CURRENT_USER");
		String role = (String) (request.getSession(false) == null ? null : request.getSession(false).getAttribute("ROLE"));

		if (uri.startsWith("/web/login") || uri.startsWith("/logout") || uri.startsWith("/css/")
				|| uri.startsWith("/js/") || uri.startsWith("/images/")) {
			chain.doFilter(req, res);
			return;
		}

		if (uri.startsWith("/admin/")) {
			if (user == null) {
				response.sendRedirect("/web/login");
				return;
			}
			if (!("ADMIN".equalsIgnoreCase(role) || "MANAGER".equalsIgnoreCase(role))) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
		}

		if (uri.startsWith("/manager/")) {
			if (user == null) {
				response.sendRedirect("/web/login");
				return;
			}
			if (!("ADMIN".equalsIgnoreCase(role) || "MANAGER".equalsIgnoreCase(role))) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
		}

		if (uri.startsWith("/user/")) {
			if (user == null) {
				response.sendRedirect("/web/login");
				return;
			}
		}

		chain.doFilter(req, res);
	}
}