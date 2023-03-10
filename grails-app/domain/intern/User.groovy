package intern

import grails.plugin.springsecurity.SpringSecurityService
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1
    transient springSecurityService

    String username
    String password
    String name
    Date last_login
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
//    static hasMany = [userRoles: UserRole]

    List<Role> getAuthorities() {
        List<Role> roles = new ArrayList<>()
        List<UserRole> userRoles= UserRole.findAllByUser(this)
        userRoles.each {
            roles.push(it?.role)
        }
        return roles
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = new BCryptPasswordEncoder().encode(password)
    }

    static transients = ['springSecurityService']

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        name nullable: false, blank: false
        last_login nullable: true
    }

    static mapping = {
	    password column: '`password`'
    }
}
