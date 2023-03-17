package intern

import grails.converters.JSON
import io.micronaut.http.HttpStatus
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder

@Secured(['ROLE_ADMIN'])
@Transactional
class ColorController {

    def productService
    def messageSource

    def index() {
        List<Color> colors = productService.getAllColor()
        render(view: "/user/color", model: [colors: colors])
    }

    def saveColor(Color color){
        productService.addDataColor(params, color)
        if (color.hasErrors()) {
            def errors = color.errors.allErrors.collect { error ->
                messageSource.getMessage(error, LocaleContextHolder.getLocale())
            }
            respond([errors: errors], status: 400)
        } else {
            flash.message = "Data Berhasil di Simpan"
            respond([:], status: 201)
        }
    }

    def deleteColor(long id){
        productService.deleteDataColor(id)

        redirect(action: "index")
    }

    def updateColor(long id){
        Color color = Color.findById(id)
        productService.updateDataColor(params, color)
        if (color.hasErrors()) {
            def errors = color.errors.allErrors.collect { error ->
                messageSource.getMessage(error, LocaleContextHolder.getLocale())
            }
            respond([errors: errors], status: 400)
        }else {
            flash.message = "Data Berhasil di Ubah"
            respond([:], status: 200)
        }
    }
}
