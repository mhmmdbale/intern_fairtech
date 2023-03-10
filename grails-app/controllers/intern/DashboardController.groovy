package intern

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class DashboardController {

    def index() {
        render(view: '/user/dashboard')
    }
}
