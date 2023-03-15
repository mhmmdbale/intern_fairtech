package intern

import grails.converters.JSON
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
class UserController {

    def userService

    def index() {
        render('hello')
    }

    @Secured(['permitAll'])
    def registerUser() {
        List<Role> roles = userService.getRole()
        render(view: '/authview/register', model: [roles: roles])
    }

    def findUser(long id){
        def result = userService.getData(id)

        render result as JSON
    }

    @Secured(['permitAll'])
    def addUser(User user) {
        userService.addData(params, user)
        if(user.hasErrors()){
            List<Role> roles = userService.getRole()
            respond([:], view: '/authview/register', model: [userError : user, roles: roles, roleError: params.role as int], status: 400)
            return
        }
        redirect(controller: 'auth', action: 'login')
    }
}
