package intern

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication

class AuthController {

    SpringSecurityService springSecurityService

    def login() {
        def authFail = params.fail

        if (springSecurityService.currentUser?.isAuthenticated()) {
            redirect(uri: '/user/index')
            return
        } else {
            render(view: '/authview/login')
        }

        [authFail: authFail]
    }

    def authenticate() {
        def username = params.username
        def password = params.password

        Authentication auth = new UsernamePasswordAuthenticationToken(username, password)
        auth = springSecurityService.authenticate(auth)
        if (auth) {
            redirect(uri: '/user/index')
        } else {
            redirect(uri: '/login/auth', params: [fail: true])
        }
    }
}
