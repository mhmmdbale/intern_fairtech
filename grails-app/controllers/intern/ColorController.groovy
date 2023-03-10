package intern
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional
class ColorController {

    def productService

    def index() { }

    def addColor(){
        List<Color> colors = productService.getAllColor()
        render(view: "/user/formColor", model: [colors: colors])
    }

    def saveColor(){
        def color = new Color(params)
        color.validate()
        if (color.hasErrors()) {
            // Redirect back to the form
            List<Color> colors = productService.getAllColor()
            render(view: "/user/formColor", model: [color : color, colors: colors])
            return
        }
        productService.addDataColor(params)

        redirect(url: "/product/formColor")
    }

    def deleteColor(long id){
        productService.deleteDataColor(id)

        redirect(url: "/product/formColor")
    }

    def updateColor(long id){
        Color check = Color.findById(id)
        if (check.code != params.code){
            def color = new Color(params)
            if (!color.validate()) {
                // If validation fails, add errors to the flash scope
                flash.message = "Kode telah ada sebelumnya"
                // Redirect back to the form
                redirect(action: "addColor")
                return
            }
        }
        productService.updateDataColor(id, params)

        redirect(url: "/product/formColor")
    }
}
