package intern

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class AuthController {

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
        def username = params.username
        def password = params.password

//        def user = User.findByUsername(username)
//        if (!user) {
//            redirect(uri: '/login/auth', params: [fail: true])
//            return
//        }
//        def encoder = new BCryptPasswordEncoder()
//
//        if (!encoder.matches(password, user.password)) {
//            redirect(uri: '/login/auth', params: [fail: true])
//            return
//        }

        Authentication auth = new UsernamePasswordAuthenticationToken(username, password)
        auth = springSecurityService.reauthenticate(username, password)
        if (auth) {
            redirect(uri: '/user/index')
        } else {
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
