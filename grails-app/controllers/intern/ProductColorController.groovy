package intern
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional
class ProductColorController {

    def index() {
        render(view: "/user/detailColor")
    }
}
