package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import grails.plugin.springsecurity.SpringSecurityService

@Transactional
class UserService {

    SpringSecurityService springSecurityService

    def serviceMethod() {

    }
    def getRole(){
        List<Role> role = Role.list()
        return role
    }
}
