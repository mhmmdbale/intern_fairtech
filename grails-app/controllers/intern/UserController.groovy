package intern

import grails.converters.JSON
import org.springframework.transaction.annotation.Transactional

@Transactional
class UserController {

    def userService

    def index() { }

    def registerUser(){
        List<Role> roles = userService.getRole()
        render(view: '/authview/register', model: [roles: roles])
    }
}
