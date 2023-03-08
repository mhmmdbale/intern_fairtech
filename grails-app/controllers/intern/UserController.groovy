package intern

import grails.converters.JSON
import org.springframework.transaction.annotation.Transactional

@Transactional
class UserController {

    def userService

    def index() {
        render('hello')
    }

    def registerUser() {
        List<Role> roles = userService.getRole()
        render(view: '/authview/register', model: [roles: roles])
    }

    def findUser(long id){
        def result = userService.getData(id)

        render result as JSON
    }

    def addUser() {
        def result = userService.addData(params)

        render result as JSON
    }
}
