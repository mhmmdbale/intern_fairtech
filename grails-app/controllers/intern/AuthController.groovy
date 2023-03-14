package intern

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.authentication.BadCredentialsException
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.authentication.AuthenticationManager

import javax.naming.AuthenticationException

class AuthController {

    def authenticationManager
    SpringSecurityService springSecurityService

    def login() {
        def authFail = params.fail

        if (springSecurityService.isLoggedIn()) {
            redirect(uri: '/dashboard')
            return
        } else {
            render(view: '/authview/login')
        }

        [authFail: authFail]
    }

    def authenticate() {
        String username = params.username
        String password = params.password

        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password)
        try {
            Authentication auth = authenticationManager.authenticate(authRequest)
            SecurityContextHolder.getContext().setAuthentication(auth)

            redirect(uri: '/dashboard')
        } catch (BadCredentialsException ex) {
            flash.message = flash.message = "Username atau Password Salah"
            redirect(uri: '/login/auth', params: [fail: true])
        }
    }

    def logout(){
        def user = springSecurityService.getCurrentUser()

        if (user) {
            new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.context.authentication)
        }

        redirect(action: 'login')
    }
}
