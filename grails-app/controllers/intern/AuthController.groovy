package intern

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.authentication.BadCredentialsException
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.web.savedrequest.HttpSessionRequestCache
import org.springframework.security.web.savedrequest.DefaultSavedRequest

class AuthController {

    AuthenticationManager authenticationManager
    SpringSecurityService springSecurityService

    def login() {
        def authFail = params.fail

        if (springSecurityService.isLoggedIn()) {
            redirect(controller: 'dashboard', action: 'index')
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

            // Get the saved request from the session
            HttpSessionRequestCache requestCache = new HttpSessionRequestCache()
            DefaultSavedRequest savedRequest = requestCache.getRequest(request, response)
            if (savedRequest != null) {
                // Redirect to the saved request URL
                response.sendRedirect(savedRequest.getRedirectUrl())
            } else {
                // Redirect to the default URL
                redirect(controller: 'dashboard', action: 'index')
            }
        } catch (BadCredentialsException e) {
            User user = new User()
            user.username = username
            user.errors.reject('user.auth.failed', 'Username atau Password anda salah.')
            respond([:], view: '/authview/login', model: [userError: user] ,status: 400)
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
