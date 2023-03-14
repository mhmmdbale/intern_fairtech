package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@Transactional
class UserService {

    SpringSecurityService springSecurityService

    def returnUser(User user){
        return [
            user: user,
            role: UserRole.findAllByUser(user).role.collect {[name: it.name] }
        ]
    }

    def getData(long id){
        User user = User.findById(id)
        return returnUser(user)
    }

    def getRole(){
        List<Role> role = Role.list()
        return role
    }

    def addData(GrailsParameterMap params) {

        User user = new User()
        user.name = params.name
        user.username = params.username

        user.password = params.password

        user.save(flush: true)
        UserRole.create(user, Role.findById(params.role))
        return returnUser(user)
    }
}
