package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class UserService {

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

    def addData(GrailsParameterMap params, User user) {
        String idRole = params.role

        user.name = params.name
        user.username = params.username
        user.password = params.password

        user.validate()
        if (params.password != params.confirm_password) {
            user.errors.reject('user.password.mismatch', 'Password yang anda masukkan tidak sama.')
        }
        if(!user.hasErrors()){
            user.save(flush: true, failOnError: true)
            UserRole.create(user, Role.findById(idRole))
        }
    }
}
