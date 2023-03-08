package intern

import grails.plugin.springsecurity.SpringSecurityService
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1
    def springSecurityService

    String username
    String password
    String name
    Date last_login
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

//    Set<Role> getAuthorities() {
//        UserRole.findAllByUser(this)*.role
//    }

//    def beforeInsert() {
//        encodePassword()
//    }
//
//    def beforeUpdate() {
//        if (isDirty('password')) {
//            encodePassword()
//        }
//    }

//    protected void encodePassword() {
//        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
//    }

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
